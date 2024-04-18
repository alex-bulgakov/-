
&НаСервереБезКонтекста
Функция ТоварыНоменклатураПриИзмененииНаСервере(Номенклатура, Дата)
	
	Возврат ОбщегоНазначения.ПолучитьЦенуНоменклатурыНаДату(Номенклатура, Дата);
	
КонецФункции

&НаКлиенте
Процедура ТоварыНоменклатураПриИзменении(Элемент)
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	ТекущиеДанные.Цена = ТоварыНоменклатураПриИзмененииНаСервере(ТекущиеДанные.Номенклатура,
											Объект.Дата);
КонецПроцедуры

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	ОбщегоНазначенияКлиент.РасчитатьСуммуСтрокиТЧ(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	ОбщегоНазначенияКлиент.РасчитатьСуммуСтрокиТЧ(ТекущиеДанные);
	
КонецПроцедуры
