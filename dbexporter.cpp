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
#include "dbexporter.h"

DBExporter::DBExporter(QString offlineStoragePath, QObject *parent) : QObject(parent),
    m_offlineStoragePath(offlineStoragePath)
{

}

void DBExporter::exportDBtoLoc(QString nameOfCopy)
{
    QString newFilePath = QString("%1/%2").arg(QStandardPaths::writableLocation(QStandardPaths::HomeLocation)).arg(nameOfCopy);
    QFile::copy(newFilePath.append(".sqlite"),newFilePath);
}
