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

#ifndef DBEXPORTER_H
#define DBEXPORTER_H

#include <QObject>
#include <QFile>
#include <QDir>
#include <QStandardPaths>

class DBExporter : public QObject
{
    Q_OBJECT
public:
    explicit DBExporter(QString offlineStoragePath,QObject *parent = nullptr);
public slots:
    void exportDBtoLoc(QString nameOfCopy);
signals:


private:
    QString m_offlineStoragePath;
};

#endif // DBEXPORTER_H
