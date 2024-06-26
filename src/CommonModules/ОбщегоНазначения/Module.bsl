#Область ПрограммныйИнтерфейс

Функция ПолучитьЦенуНоменклатурыНаДату(Номенклатура, Дата) Экспорт

	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ЦеныНоменклатурыСрезПоследних.Цена КАК Цена
		|ИЗ
		|	РегистрСведений.ЦеныНоменклатуры.СрезПоследних(&Период, Номенклатура = &Номенклатура) КАК ЦеныНоменклатурыСрезПоследних";
	
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	Запрос.УстановитьПараметр("Период", Дата);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если НЕ РезультатЗапроса.Пустой() Тогда
		Выборка = РезультатЗапроса.Выбрать();
		Выборка.Следующий();
		Возврат Выборка.Цена;
	Иначе
		Возврат 0;
	КонецЕсли;

КонецФункции // ПолучитьЦенуНоменклатурыНаДату()

Функция ПолучитьЕдиницуИзмеренияНоменклатуры(Номенклатура) Экспорт

	Возврат Номенклатура.ЕдиницаИзмерения;

КонецФункции // ПолучитьЕдиницуИзмеренияНоменклатуры()

Функция ТекущийПользователь() Экспорт
	
	// Вычисляем актуальное имя пользователя, даже если оно было ранее изменено в текущем сеансе;
	// Например, для подключения к текущей ИБ через внешнее соединение из этого сеанса;
	// Во всех остальных случаях достаточно получить ПользователиИнформационнойБазы.ТекущийПользователь().
	ТекущийПользователь = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(
		ПользователиИнформационнойБазы.ТекущийПользователь().УникальныйИдентификатор);
	
	Если ТекущийПользователь = Неопределено Тогда
		ТекущийПользователь = ПользователиИнформационнойБазы.ТекущийПользователь();
	КонецЕсли;
	
	Возврат ТекущийПользователь;
КонецФункции

Функция ПолучитьСебестоимостьТовара(Товар) Экспорт

	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	СебестоимостьСрезПоследних.ЦенаЗаЕдиницу КАК ЦенаЗаЕдиницу
		|ИЗ
		|	РегистрСведений.Себестоимость.СрезПоследних КАК СебестоимостьСрезПоследних
		|ГДЕ
		|	СебестоимостьСрезПоследних.Номенклатура = &Номенклатура";
	
	Запрос.УстановитьПараметр("Номенклатура", Товар);
	
	РезультатЗапроса = Запрос.Выполнить();         
	
	Если Не РезультатЗапроса.Пустой() Тогда
	
		Выборка = РезультатЗапроса.Выбрать();
		Выборка.Следующий();
		Возврат Выборка.ЦенаЗаЕдиницу;
		
	Иначе
		
		Возврат Неопределено;
		
	КонецЕсли;

КонецФункции // ПолучитьСебестоимостьТовара()

Функция РасчитатьЦену(Себестоимость) Экспорт

	Наценка = РегистрыСведений.Наценка.ПолучитьПоследнее(ТекущаяДатаСеанса()).Наценка;
	
	Возврат Себестоимость * Наценка / 100;

КонецФункции // РасчитатьЦену()



#КонецОбласти
