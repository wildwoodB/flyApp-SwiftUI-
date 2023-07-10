
#flyApp

Project meaning: an example of the appearance of an aggregator for buying plane tickets.

Stack: SwiftUI, MVVM, URLSession, Unit-test.
_________________
Что было сделано:

1)Сделан экран поискового результата по направлению "Москва - Санкт-Петербург".

2)Получен массив данных из бэка и распарсен(с помощью URLSession) в модель данных всего приложения.

3)Данные посредствам viewModel были отсортированы в порядке увеличения цены, от самой низкой к самой высокой и переданы во view.

4)По нажатию на ячейку с нужным билетом открывается экран детального просмотра информации об билете.

5)По нажатию на кнопку "Купить билет за..." открывается алерт с указанием того, что билет куплен.

6)Так же были написаны простейшие тесты для проверки работоспособности UI-элементов и Unit-тест для проверки работоспособности viewModel.


------

![simRec (online-video-cutter com)](https://github.com/wildwoodB/flyApp-SwiftUI-/assets/111679856/d0785262-e04a-4ac7-8f00-6b34f30258d9)
