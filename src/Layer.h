//
//  Layer.h
//  RunParticles
//
//  Created by Doug Letterman on 3/30/13.
//
//

#ifndef RunParticles_Layer_h
#define RunParticles_Layer_h

#include <QString>
#include <QDateTime>

#include "BoundingBox.h"
#include "ViewCtx.h"
#include "Types.h"

// Represents a single map layer

typedef unsigned int LayerId;

class Layer
{
public:
    
    Layer() : _id(Layer::getId()) {};
    
    virtual ~Layer() {};
    
    LayerId id() { return _id; }
    
    virtual QString name() const = 0;
    
    virtual QString sport() const = 0;
    
    virtual QDateTime startTime() const = 0;
    
    virtual unsigned int passes() const { return 1; }
    
    virtual unsigned int duration() const { return 0; }
    
    virtual void project(const ViewCtx*) = 0;
    
    virtual void draw(uint pass, const ViewCtx*, const TimeCtx*) = 0;
    
    // projected bounds
    virtual BoundingBox getBoundingBox() const = 0;
    
protected:
    static LayerId getId() { return _gid++; }
    
    static LayerId _gid;
    
    LayerId _id;
};

#endif
