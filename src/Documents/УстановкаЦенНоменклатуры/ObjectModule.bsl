
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	Движения.ЦеныНоменклатуры.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Если ТекСтрокаТовары.НоваяЦена <> ТекСтрокаТовары.ТекущаяЦена Тогда
			Движение = Движения.ЦеныНоменклатуры.Добавить();
			Движение.Период = Дата;
			Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
			Движение.Цена = ТекСтрокаТовары.НоваяЦена;
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры
