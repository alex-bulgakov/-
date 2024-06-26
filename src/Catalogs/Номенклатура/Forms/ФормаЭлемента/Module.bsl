#Область ОбработчикиСобытийФормы

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ИзменитьВидимостьСсылки();
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Не ЗначениеЗаполнено(Объект.ЕдиницаИзмерения) Тогда
		Объект.ЕдиницаИзмерения = Справочники.ЕдиницыИзмерения.шт;
	КонецЕсли;                   
	
	Если Не ЗначениеЗаполнено(Объект.ВидНоменклатуры) Тогда
		Объект.ВидНоменклатуры = Перечисления.ВидНоменклатуры.Товар;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПерейтиПоСсылкеНажатие(Элемент)
	
	ЗапуститьПриложениеАсинх(Объект.СсылкаНаТовар);
	
КонецПроцедуры

&НаКлиенте
Процедура СсылкаНаТоварПриИзменении(Элемент)
	
	ИзменитьВидимостьСсылки();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ИзменитьВидимостьСсылки()
	
	Если Объект.СсылкаНаТовар = "" Тогда
		Элементы.ПерейтиПоСсылке.Гиперссылка = Ложь;
		Элементы.ПерейтиПоСсылке.ЦветТекста = Новый Цвет(200, 200, 200);
	Иначе
		Элементы.ПерейтиПоСсылке.Гиперссылка = Истина;
		Элементы.ПерейтиПоСсылке.ЦветТекста = Новый Цвет(0, 0, 255);
	КонецЕсли;
	
КонецПроцедуры // ИзменитьВидимостьСсылки()

&НаКлиенте
Асинх Процедура КартинкаНажатие(Элемент, СтандартнаяОбработка)

	ИдентификаторФайла = Новый УникальныйИдентификатор;
	РаботаСФайламиКлиент.ДобавитьФайлы(Объект.Ссылка, ИдентификаторФайла, ОбщегоНазначенияКлиент.ФильтрФайловИзображений());
	
КонецПроцедуры

&НаКлиенте
Асинх Процедура ДобавитьКартинку(ПутьКФайлу = Неопределено)
	
	Если ПутьКФайлу = Неопределено Тогда
	
		// 1. Показать диалог выбора файла с помещением файла на сервер
		ПараметрыДиалога = Новый ПараметрыДиалогаПомещенияФайлов();
		ПараметрыДиалога.Заголовок = "Выберите файл";
		ПараметрыДиалога.Фильтр = "Изображение | *.jpg; *.png; *.bmp";
		
		ОписаниеФайла = Ждать ПоместитьФайлНаСерверАсинх(,,,ПараметрыДиалога, УникальныйИдентификатор);

	Иначе	
		ОписаниеФайла = Ждать ПоместитьФайлНаСерверАсинх(,,,ПутьКФайлу, УникальныйИдентификатор);
	КонецЕсли;
	
	Если ОписаниеФайла <> Неопределено Тогда
		
		АдресКартинки = ОписаниеФайла.Адрес;
		
		ПараметрыФайла = Новый Структура;
		ПараметрыФайла.Вставить("ВладелецФайла", Объект.Ссылка);
		ПараметрыФайла.Вставить("Адрес", ОписаниеФайла.Адрес);
		ПараметрыФайла.Вставить("Имя", ОписаниеФайла.СсылкаНаФайл.Имя);
		ПараметрыФайла.Вставить("Расширение", ОписаниеФайла.СсылкаНаФайл.Расширение);
		ПараметрыФайла.Вставить("Размер", ОписаниеФайла.СсылкаНаФайл.Размер());
		
		Объект.ФайлКартинки = ДобавитьФайлСервер(ПараметрыФайла);   
					
	КонецЕсли;

КонецПроцедуры // ДобавитьКартинку()

&НаСервереБезКонтекста
Функция ДобавитьФайлСервер(СтруктураПараметров)
	
	Возврат РаботаСФайлами.ДобавитьФайл(СтруктураПараметров);

КонецФункции // ДобавитьФайлСервер()


#КонецОбласти


