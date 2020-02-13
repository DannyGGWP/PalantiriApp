/*
 *
 *   This file is part of PalantiriApp.
 *
 *    PalantiriApp is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    PalantiriApp is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with PalantiriApp.  If not, see <https://www.gnu.org/licenses/>.
 *
 *    Copyright 2020 Team 237
 */
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
