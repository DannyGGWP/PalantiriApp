#ifndef SCOUTINGCLIENT_H
#define SCOUTINGCLIENT_H

#include <QObject>

class ScoutingClient : public QObject
{
    Q_OBJECT
public:
    explicit ScoutingClient(QObject *parent = nullptr);
public slots:
    void setServerUrl(QString server);
    int postMatch(QVariantList results);

signals:

private:
    QString m_serverUrl;
};

#endif // SCOUTINGCLIENT_H
