#############################################################################
# Makefile for building: RunParticles.app/Contents/MacOS/RunParticles
# Generated by qmake (2.01a) (Qt 4.8.4) on: Wed Oct 16 08:22:53 2013
# Project:  RunParticles.pro
# Template: app
# Command: /usr/local/Trolltech/Qt-4.8.4/bin/qmake -spec /usr/local/Trolltech/Qt-4.8.4/mkspecs/macx-xcode -o RunParticles.xcodeproj/project.pbxproj RunParticles.pro
#############################################################################

MOC       = /usr/local/Trolltech/Qt-4.8.4/bin/moc
UIC       = /usr/local/Trolltech/Qt-4.8.4/bin/uic
LEX       = flex
LEXFLAGS  = 
YACC      = yacc
YACCFLAGS = -d
DEFINES       = -DQT_XML_LIB -DQT_OPENGL_LIB -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
INCPATH       = -I/usr/local/Trolltech/Qt-4.8.4/mkspecs/macx-xcode -I. -I/usr/local/Trolltech/Qt-4.8.4/lib/QtCore.framework/Versions/4/Headers -I/usr/local/Trolltech/Qt-4.8.4/include/QtCore -I/usr/local/Trolltech/Qt-4.8.4/lib/QtGui.framework/Versions/4/Headers -I/usr/local/Trolltech/Qt-4.8.4/include/QtGui -I/usr/local/Trolltech/Qt-4.8.4/lib/QtOpenGL.framework/Versions/4/Headers -I/usr/local/Trolltech/Qt-4.8.4/include/QtOpenGL -I/usr/local/Trolltech/Qt-4.8.4/lib/QtXml.framework/Versions/4/Headers -I/usr/local/Trolltech/Qt-4.8.4/include/QtXml -I/usr/local/Trolltech/Qt-4.8.4/include -I/usr/local/cinder_0.8.5_mac/include -I/usr/local/cinder_0.8.5_mac/boost/boost -I/System/Library/Frameworks/OpenGL.framework/Versions/A/Headers -I/System/Library/Frameworks/AGL.framework/Headers -I. -I/usr/local/include -I/System/Library/Frameworks/CarbonCore.framework/Headers -F/usr/local/Trolltech/Qt-4.8.4/lib
DEL_FILE  = rm -f
MOVE      = mv -f

IMAGES = 
PARSERS =
preprocess: $(PARSERS) compilers
clean preprocess_clean: parser_clean compiler_clean

parser_clean:
check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compilers: ./moc_GLWidget.cpp ./moc_MainWindow.cpp ./moc_Map.cpp
compiler_objective_c_make_all:
compiler_objective_c_clean:
compiler_moc_header_make_all: moc_GLWidget.cpp moc_MainWindow.cpp moc_Map.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_GLWidget.cpp moc_MainWindow.cpp moc_Map.cpp
moc_GLWidget.cpp: ../src/Map.h \
		../src/Layer.h \
		../src/ViewCtx.h \
		../src/Types.h \
		../src/TimeCtx.h \
		../src/MapView.h \
		../src/GLWidget.h
	/usr/local/Trolltech/Qt-4.8.4/bin/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ ../src/GLWidget.h -o moc_GLWidget.cpp

moc_MainWindow.cpp: ../src/GLWidget.h \
		../src/Map.h \
		../src/Layer.h \
		../src/ViewCtx.h \
		../src/Types.h \
		../src/TimeCtx.h \
		../src/MapView.h \
		../src/MainWindow.h
	/usr/local/Trolltech/Qt-4.8.4/bin/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ ../src/MainWindow.h -o moc_MainWindow.cpp

moc_Map.cpp: ../src/Layer.h \
		../src/ViewCtx.h \
		../src/Types.h \
		../src/TimeCtx.h \
		../src/Map.h
	/usr/local/Trolltech/Qt-4.8.4/bin/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ ../src/Map.h -o moc_Map.cpp

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_rez_source_make_all:
compiler_rez_source_clean:
compiler_uic_make_all:
compiler_uic_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean 

