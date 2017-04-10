# Многопоточность и сетевое взаимодействие

## Не забыть
* Отметиться
* Оставить отзыв
* Сдать ДЗ №2 до 11.04

## План
- Выясним, как получать данные из сети
- Поймём, зачем нужна многопоточность
- Поговорим о разных типах многопоточности

## Сетевое взаимодействие
- показ веб-страниц
- просто показ
- дополнительное взаимодействие
- быстрые загрузки
- парсинг данных
- долгие загрузки (фон)

## Показ веб-страниц 1/3
Просто показывать веб-страницы умеет SFSafariViewController
- внутри обычный safari
- общие с safari пароли и прочее
- никакого контроля со стороны приложения

## Показ веб-страниц 2/3
Иногда этого недостаточно, и надо использовать WKWebView
- контроль над навигацией и вводом
- использует системный поток для js
- ускоренный js

## Показ веб-страниц 3/3
Есть старый вариант UIWebView, который всё ещё может
- использовать NSURLProtocol
- дать доступ к JavaScriptCore

(если это непонятно, то вам это не надо)

## HTTP 1/3
По большей части надо не показывать страницы, грузить данные
- json
- картинки

## HTTP 2/3
Загрузка данных как с сервера, так и на сервер делается посредством URLSession
- http, ftp протоколы
- https
- работа в фоне

## HTTP 3/3
При загрузке json его надо распарсить
- JSONSerialization превращает в Dictionary/Array
- Gloss, SwiftyJson (и другие) превращет это в класс

## WebSocket
Постоянно живущее двустороннее соединение поверх http
- много запросов
- получение обновление от сервера
- сторонние библиотеки

## Низкий уровень (TCP, UDP etc.)
Это если совсем что-то странное нужно, например свой STUN/TURN/ICE 
- CFNetworking
- Библиотеки по ссылкам

## Поточная модель
Вспомним, как плохо грузилась картинка
* runloop в котором работает UI и который обрабатывает взаимодействие с пользователем 
* Если делать в нём длинные операции — интерфейс будет очень сильно тормозить
* выход есть

## GCD


## NSOperationQueue

## Потокобезопасность



## Ссылки про сеть
- [SwiftWebSocket](https://github.com/tidwall/SwiftWebSocket)
- [SocketRocket](https://github.com/facebook/SocketRocket)
- [CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket)
- [Blue Socket](https://github.com/IBM-Swift/BlueSocket)

## Ссылки про многопоточность
- [Apple's Concurrency Programming Guide](https://developer.apple.com/library/content/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008091)
- [Apple's Multithreading guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Multithreading/Introduction/Introduction.html)