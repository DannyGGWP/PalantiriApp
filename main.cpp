#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTextStream>
#include <iostream>
#include <stdio.h>
#include "dbexporter.h"
#include "scoutingclient.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setOrganizationName("Team 237 Programming");
    app.setOrganizationDomain("ScoutingApp");
    QTextStream ts(stdout);
    QQmlApplicationEngine engine;
    ScoutingClient sClient;
    engine.rootContext()->setContextProperty("scoutingAPI",&sClient);
    DBExporter dbe(engine.offlineStorageDatabaseFilePath("CompMatchDB"));
    engine.rootContext()->setContextProperty("exporter", &dbe);
    ts << engine.offlineStoragePath() << endl;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
