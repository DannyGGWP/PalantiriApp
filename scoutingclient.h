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
#ifndef SCOUTINGCLIENT_H
#define SCOUTINGCLIENT_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonObject>

class ScoutingClient : public QObject
{
    Q_OBJECT
public:
    explicit ScoutingClient(QObject *parent = nullptr);
public slots:
    void setServerUrl(QString server);
    void postMatch(const QVariantMap &results);
    void isFinished(QNetworkReply *reply);
signals:
    void sucess();
    void failure();
private:
    QString m_serverUrl;
    QNetworkAccessManager *mp_Manager;
};

#endif // SCOUTINGCLIENT_H
