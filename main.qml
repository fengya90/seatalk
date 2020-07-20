import QtQuick.Controls 1.1
import QtWebView 1.1
import Qt.labs.platform 1.1
import QtQuick.Window 2.12
import QtQuick.Layouts 1.1
import QtQml 2.12
import Process 1.0



ApplicationWindow {   
    id: applicationWindow
    visible: true
    x: initialX
    y: initialY
    width: initialWidth
    height: initialHeight
    title: "SeaTalk"
    property bool showProgress: webView.loading

    Process {
          id: process
    }

    SystemTrayIcon {
        id:systemTrayIcon
        visible: true
        iconSource: "qrc:/images/icon.png"
        iconName : "SeaTalk"

        onActivated: {
            if (!applicationWindow.active) {
                applicationWindow.show()
                applicationWindow.raise()
                applicationWindow.requestActivate()
            } else {
                applicationWindow.hide()
            }
        }

        menu: Menu {
            visible:false
            MenuItem {
                text: qsTr("Show Main Windown")
                onTriggered: {
                    applicationWindow.show()
                    applicationWindow.raise()
                    applicationWindow.requestActivate()
                }

            }
            MenuItem {
                text: qsTr("Screenshot")
                onTriggered: {
                    process.start("spectacle", []);
                }
            }
            MenuItem {
                separator:true
            }
            MenuItem {
                text: qsTr("Quit")
                onTriggered: Qt.quit()
            }
        }
    }

    WebView {
        id: webView
        anchors.fill: parent
        url: initialUrl
        onLoadingChanged: {
            if(loadRequest.status === WebView.LoadSucceededStatus){
                webView.runJavaScript("document.documentElement.style.overflow = 'hidden';document.documentElement.style.height = '100%';", function(result) {});
            }
        }
    }

    statusBar: StatusBar {
        id: statusBar
        visible: showProgress
        RowLayout {
            anchors.fill: parent
            Label { text: webView.loadProgress == 100 ? qsTr("Done") : qsTr("Loading: ") + webView.loadProgress + "%" }
        }
    }



    onClosing: {
        close.accepted = false
        applicationWindow.hide()
    }
}
