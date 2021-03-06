/*
 *  Map.cpp
 *  RunParticles
 *
 *  Created by Doug Letterman on 2/18/13.
 *  Copyright 2013 Doug Letterman. All rights reserved.
 *
 */

#include "Map.h"

#include "MapProjectorWorker.h"

Map::Map(QObject *parent)
: QObject(parent),
_projection(Projection()),
_duration(0)
{
    qRegisterMetaType<LayerPtr>("LayerPtr");
    _projector = new MapProjectorWorker(&_projection, this);
    connect(_projector, &MapProjectorWorker::signalReady,
            this, &Map::_onLayerProjected);
}

Map::~Map()
{
    _projector->cancel();
}

void
Map::draw(const ViewCtx &viewCtx, const TimeCtx &timeCtx)
{
    PassMap::iterator pass;
    LayerPtrList::iterator it;
    for (pass = _passes.begin(); pass != _passes.end(); pass++) {
        unsigned int thisPass = *pass;
        for (it = _layers.begin(); it != _layers.end(); it++) {
            (*it)->draw(thisPass, viewCtx, timeCtx);
        }
    }
}

bool
Map::addLayer(Layer *layer)
{
    LayerPtr layerPtr(layer);
    _projector->project(layerPtr);
    return true;
}

void
Map::addLayers(QList<Layer*> layers)
{
    QList<LayerPtr> layerPtrs;
    Layer *layer;
    foreach(layer, layers) {
        layerPtrs.append(LayerPtr(layer));
    }
    _projector->project(layerPtrs);
}

Layer*
Map::getLayer(const LayerId id)
{
    if (_layerMap.find(id) != _layerMap.end())
        return _layerMap[id].get();
    return NULL;
}

LayerPtrList
Map::getLayers() const
{
    return _layers;
}

void
Map::clearLayers()
{
    LayerPtrList::iterator it;
    for (it = _layers.begin(); it != _layers.end(); it++) {
        (*it)->disconnect();
    }
    _passes.clear();
    _layers.clear();
    _layerMap.clear();
}

bool
Map::onMapClicked(const MapPoint &pt, const ViewCtx &viewCtx) const
{
    double limit = pow(viewCtx.getResolution() * SELECTION_TOLERANCE_PIXELS, 2);
    LayerId closestId = 0;
    double closestDistance = 0.;
    bool found = false;
    LayerPtrList::const_iterator it;
    for (it = _layers.begin(); it != _layers.end(); it++) {
        if ((*it)->visible()) {
            double myDist = pt.distanceSquared((*it)->position());
            if (myDist < limit && (!found || myDist < closestDistance)) {
                closestDistance = myDist;
                closestId = (*it)->id();
                found = true;
            }
        }
    }
    if (found)
        emit(signalLayerClicked(closestId));
    return found;
}

void
Map::_onLayerProjected(LayerPtr layerPtr)
{
    _layers.push_back(layerPtr);
    std::pair<LayerId, LayerPtr> mypair(layerPtr->id(), layerPtr);
    _layerMap.insert(mypair);
    PassMap layerPasses = layerPtr->passes();
    _passes.insert(layerPasses.begin(), layerPasses.end());
    _duration = (layerPtr->duration() > _duration) ? layerPtr->duration() : _duration;
    connect(layerPtr.get(), SIGNAL(layerUpdated()), SIGNAL(layerUpdated()));
    emit(signalLayerAdded(layerPtr->id()));
}
