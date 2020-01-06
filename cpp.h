#ifndef CPP_H
#define CPP_H

#include <QClipboard>
#include <QObject>
#include <QGuiApplication>

class cpp : public QObject
{
    Q_OBJECT
public:
    explicit cpp(QObject *parent = nullptr);
    Q_INVOKABLE bool test(QString s);
    Q_INVOKABLE void copy(QString x);
    Q_INVOKABLE void paste();
    Q_INVOKABLE QString analize(QString x);
    Q_INVOKABLE QString getClipboard();
    ~cpp();

signals:
    void text(QString texto);

public slots:

private:
//    QClipboard c;
};

#endif // CPP_H
