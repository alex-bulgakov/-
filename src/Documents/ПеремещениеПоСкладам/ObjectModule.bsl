
Процедура ОбработкаПроведения(Отказ, Режим)

	// регистр ОстаткиТоваров Приход
	Движения.ОстаткиТоваров.Записывать = Истина;
	
	Для Каждого ТекСтрокаНоменклатураДляПеремещения Из НоменклатураДляПеремещения Цикл
		
		Движение = Движения.ОстаткиТоваров.ДобавитьРасход();
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаНоменклатураДляПеремещения.Номенклатура;
		Движение.Склад = СкладОтправитель;
		Движение.Количество = ТекСтрокаНоменклатураДляПеремещения.Количество;
		
		Движение = Движения.ОстаткиТоваров.ДобавитьПриход();
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаНоменклатураДляПеремещения.Номенклатура;
		Движение.Склад = СкладПолучатель;
		Движение.Количество = ТекСтрокаНоменклатураДляПеремещения.Количество;
		
	КонецЦикла;

КонецПроцедуры
