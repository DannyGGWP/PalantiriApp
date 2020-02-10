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
    qDebug() << res->readAll() << endl;
}

void ScoutingClient::isFinished(QNetworkReply *reply)
{

}
