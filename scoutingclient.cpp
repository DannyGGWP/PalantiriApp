#include "scoutingclient.h"

ScoutingClient::ScoutingClient(QObject *parent) : QObject(parent)
{

}

void ScoutingClient::setServerUrl(QString server)
{
    m_serverUrl = server;
}
