#-------------------------------------------------
#
# Project created by QtCreator 2016-02-17T17:22:06
#
#-------------------------------------------------

QT       += core gui x11extras dbus multimedia xml network positioning svg charts thelib concurrent
CONFIG   += c++14
LIBS     += -lX11 -lxcb -lxcb-keysyms -lsystemd -lKF5AkonadiCore -lpulse -lpulse-mainloop-glib -lcrypt

INCLUDEPATH += /usr/include/glib-2.0/ /usr/lib/glib-2.0/include/

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

blueprint {
    message(Configuring theShell to be built as blueprint)
    TARGET = theshellb

    DEFINES += "SHAREDIR=\\\"/usr/share/theshellb/\\\""
} else {
    message(Configuring theShell to be built as stable)
    TARGET = theshell

    DEFINES += "SHAREDIR=\\\"/usr/share/theshell/\\\""
}

TEMPLATE = app
QDBUSXML2CPP_ADAPTOR_HEADER_FLAGS = -l NotificationDBus -i notificationdbus.h
QDBUSXML2CPP_ADAPTOR_SOURCE_FLAGS = -l NotificationDBus -i notificationdbus.h
#DBUS_ADAPTORS += org.freedesktop.Notifications.xml

#notifications.files = org.freedesktop.Notifications.xml
#notifications.header_flags = -l NotificationDBus -i notificationdbus.h
#DBUS_ADAPTORS += notifications

#DBUS_ADAPTORS += com.canonical.AppMenu.Registrar.xml

power.files = org.thesuite.power.xml

#location.files = org.freedesktop.GeoClue2.Agent.xml
#location.header_flags = -l LocationServices -i locationservices.h
#location.source_flags = -l LocationServices -i locationservices.h

dsig.files = org.thesuite.theshell.xml

DBUS_ADAPTORS += power dsig #location

SOURCES += main.cpp\
        mainwindow.cpp \
    window.cpp \
    menu.cpp \
    endsessionwait.cpp \
    background.cpp \
    upowerdbus.cpp \
    infopanedropdown.cpp \
    clickablelabel.cpp \
    thewaveworker.cpp \
    loginsplash.cpp \
    hoverframe.cpp \
    choosebackground.cpp \
    switch.cpp \
    FlowLayout/flowlayout.cpp \
    touchkeyboard.cpp \
    segfaultdialog.cpp \
    globalfilter.cpp \
    systrayicons.cpp \
    nativeeventfilter.cpp \
    hotkeyhud.cpp \
    dbusevents.cpp \
    fadebutton.cpp \
    rundialog.cpp \
    thewavefeedbackframe.cpp \
    mousescrollwidget.cpp \
    animatedstackedwidget.cpp \
    onboarding.cpp \
    newmedia.cpp \
    bthandsfree.cpp \
    tutorialwindow.cpp \
    screenshotwindow.cpp \
    audiomanager.cpp \
    locationservices.cpp \
    taskbarmanager.cpp \
    dbussignals.cpp \
    networkmanager/networkwidget.cpp \
    networkmanager/availablenetworkslist.cpp \
    notificationsWidget/notificationswidget.cpp \
    notificationsWidget/notificationsdbusadaptor.cpp \
    notificationsWidget/notificationpopup.cpp \
    notificationsWidget/notificationobject.cpp \
    notificationsWidget/notificationappgroup.cpp \
    notificationsWidget/notificationpanel.cpp \
    apps/appslistmodel.cpp \
    apps/app.cpp

HEADERS  += mainwindow.h \
    window.h \
    menu.h \
    endsessionwait.h \
    background.h \
    upowerdbus.h \
    infopanedropdown.h \
    clickablelabel.h \
    thewaveworker.h \
    loginsplash.h \
    hoverframe.h \
    choosebackground.h \
    switch.h \
    FlowLayout/flowlayout.h \
    touchkeyboard.h \
    segfaultdialog.h \
    globalfilter.h \
    systrayicons.h \
    nativeeventfilter.h \
    hotkeyhud.h \
    dbusevents.h \
    fadebutton.h \
    rundialog.h \
    thewavefeedbackframe.h \
    mousescrollwidget.h \
    animatedstackedwidget.h \
    onboarding.h \
    newmedia.h \
    bthandsfree.h \
    tutorialwindow.h \
    screenshotwindow.h \
    audiomanager.h \
    internationalisation.h \
    locationservices.h \
    taskbarmanager.h \
    dbussignals.h \
    networkmanager/networkwidget.h \
    networkmanager/availablenetworkslist.h \
    notificationsWidget/notificationswidget.h \
    notificationsWidget/notificationsdbusadaptor.h \
    notificationsWidget/notificationpopup.h \
    notificationsWidget/notificationobject.h \
    notificationsWidget/notificationappgroup.h \
    notificationsWidget/notificationpanel.h \
    apps/appslistmodel.h \
    apps/app.h

FORMS    += mainwindow.ui \
    menu.ui \
    endsessionwait.ui \
    background.ui \
    notificationdialog.ui \
    infopanedropdown.ui \
    loginsplash.ui \
    choosebackground.ui \
    touchkeyboard.ui \
    segfaultdialog.ui \
    hotkeyhud.ui \
    rundialog.ui \
    onboarding.ui \
    newmedia.ui \
    tutorialwindow.ui \
    screenshotwindow.ui \
    networkmanager/networkwidget.ui \
    notificationsWidget/notificationswidget.ui \
    notificationsWidget/notificationpopup.ui \
    notificationsWidget/notificationappgroup.ui \
    notificationsWidget/notificationpanel.ui

DISTFILES += \
    org.freedesktop.Notifications.xml \
    theshell.desktop \
    theshellb.desktop

RESOURCES += \
    resources.qrc \
    resources2.qrc

TRANSLATIONS += translations/vi_VN.ts \
    translations/da_DK.ts \
    translations/es_ES.ts \
    translations/lt_LT.ts \
    translations/nl_NL.ts \
    translations/pl_PL.ts \
    translations/pt_BR.ts \
    translations/ru_RU.ts \
    translations/sv_SE.ts \
    translations/en_AU.ts

unix {
    target.path = /usr/bin/

    translations.files = translations/*
    xsession.path = /usr/share/xsessions

    blueprint {
        translations.path = /usr/share/theshellb
        xsession.files = theshellb.desktop
    } else {
        translations.path = /usr/share/theshell
        xsession.files = theshell.desktop
    }

    INSTALLS += target translations xsession
}
