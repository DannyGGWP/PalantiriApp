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
#include "scoutingclient.h"
#include <QJsonDocument>
ScoutingClient::ScoutingClient(QObject *parent) : QObject(parent)
{
    mp_Manager = new QNetworkAccessManager(this);
    connect(mp_Manager,&QNetworkAccessManager::finished,
            this, &ScoutingClient::isFinished );
}

void ScoutingClient::setServerUrl(QString server)
{
    m_serverUrl = server;
}

void ScoutingClient::postMatch(const QVariantMap &results)
{
    auto jsonObj = QJsonObject::fromVariantMap(results);
    QUrl url(m_serverUrl);
    QNetworkRequest req = QNetworkRequest(url);
    req.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    auto *res = mp_Manager->post(req, QJsonDocument(jsonObj).toJson());
//    while (!res->isFinished()) {

//    }
    qDebug() << res->readAll();
}

void ScoutingClient::isFinished(QNetworkReply *reply)
{
 Q_UNUSED(reply);
}
