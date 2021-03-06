//
//  main.cpp
//  RunParticles
//
//  Created by Doug Letterman on 9/27/13.
//
//

#include <QApplication>
#include "GLWidget.h"
#include "MainWindow.h"
#include "Map.h"

int main(int argc, char **argv)
{
    QApplication app(argc, argv);
    app.setApplicationName("RunParticles");
    app.setOrganizationDomain("renderfast.com");
    app.setOrganizationName("Renderfast");
    app.setApplicationVersion("1.0");
    
    MainWindow mainWindow;
    
    app.exec();
}

