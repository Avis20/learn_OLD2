# скрипт для создания словарей wpa. нужно накачать много обычных словарей в папку и там запустить dict-cr (содержимое ниже)

#!/bin/bash

# открыть терминал в папке со словарями (внутри папок со словарями быть не должно)
# получить имена/размеры файлов и записать в dict-list
ls -1 -sh > dict-list
sleep 5
# обьединение всех файлов кроме dict-cr и dict-list
ls | grep -v ‘dict-[cr/list]’ | xargs cat > dict-big
sleep 5
# удалить все файлы кроме dict-cr, dict-list и dict-big
ls | grep -v ‘dict-[cr/list/big]’ | xargs rm
sleep 5
# удаление строк меньше 8 символов
sed -n ‘/^.\{8\}/p’ dict-big > dict-1
sleep 5
# удалить dict-big
rm -Rf dict-big
sleep 5
# удаление строк с 8-ми и 9-ти значными цифрами
sed ‘/^[0-9]\{8,9\}$/ d’ dict-1 > dict-2
sleep 5
# удалить dict-1
rm -Rf dict-1
sleep 5
# сортировка и удаление дубликатов
cat dict-2 | sort | uniq > dict-wpa
# удалить dict-2
rm -Rf dict-2
# уведомление
notify-send “dict-wpa complete!”

# Дополнительные команды
# Удаляет все пробелы/табы перед каждой строкой
# sed ‘s/^[ \t]*//’ dict-2 > dict-3
# Удаляет все пробелы/табы в конце каждой строки
# sed ‘s/[ \t]*$//’ dict-2 > dict-2
# Удаляет все пробелы/табы в начале и в конце каждой строки
# sed ‘s/^[ \t]*//;s/[ \t]*$//’ dict-2 > dict-3
# Удалить первые 5 символов каждой строки
# cat dict-2 | cut -c 6- > dict-3
# Удалить последний символ каждой строки
# rev dict-2 | cut -c 2- | rev > dict-3

