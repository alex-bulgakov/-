
&НаСервереБезКонтекста
Функция ПолучитьСебестоимость(Номенклатура)
	
	Возврат ОбщегоНазначения.ПолучитьСебестоимостьТовара(Номенклатура);
	
КонецФункции

&НаКлиенте
Процедура КомплектующиеКоличествоПриИзменении(Элемент)
	ТекущиеДанные = Элементы.Комплектующие.ТекущиеДанные;                          
	Себестоимость = ПолучитьСебестоимость(ТекущиеДанные.Номенклатура);
	Если Себестоимость <> Неопределено Тогда
		ТекущиеДанные.Себестоимость = ПолучитьСебестоимость(ТекущиеДанные.Номенклатура) * ТекущиеДанные.Количество;
	Иначе
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = СтрШаблон("Себестоимость товара ""%1"" не установлена", ТекущиеДанные.Номенклатура);
		Сообщение.Сообщить();
	КонецЕсли;
КонецПроцедуры

&НаСервереБезКонтекста
Функция РасчитатьЦенуНаСервере(Себестоимость)
	
	Возврат ОбщегоНазначения.РасчитатьЦену(Себестоимость);
	
КонецФункции

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	Объект.Себестоимость = Объект.Комплектующие.Итог("Себестоимость") / Объект.Количество;
	Если Не Объект.КорректироватьЦенуВручную И Объект.ГотоваяПродукция Тогда
		Объект.Цена = РасчитатьЦенуНаСервере(Объект.Себестоимость);
		Прибыль = Объект.Цена - Объект.Себестоимость;
	Иначе
		Объект.Цена = 0;
		Прибыль = 0;
	КонецЕсли;
	
КонецПроцедуры


