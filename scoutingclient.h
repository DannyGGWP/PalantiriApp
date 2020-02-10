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
