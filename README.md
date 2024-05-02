Копирование файлов из одной директории в другую. Файл script.sh является скриптом на bash, который на вход принимает два параметра - две директории (входная директория и выходная директория). Во входной директории могут находиться как файлы, так и вложенные директории (внутри которых тоже могут быть как файлы, так и папки) - уровень вложенности может быть любой. Скрипт "обходит" входную директорию и копирует все файлы из нее (и из всех сложенных директорий) в выходную директорию - но уже без иерархии, а просто все файлы - внутри выходной директории. Если в выходной директории уже существует файл с тем же названием, что и во входной, то к названию добавляемого файла добавляется уникальный номер (файлы получают номера в порядке их добавления в выходную директорию). Чтобы запустить скрипт, сохраните его себе, в терминале войдите в каталог со скриптом (команда "cd /mnt/дальнейший путь"). Запустите код командой "bash script.sh", если скрипт не запускается, то возможно есть проблема с символами перевода строки в скрипте. Чтобы исправить это, вам нужно сконвертировать скрипт в формат Unix, для этого последовательно запустите следующие команды "sudo apt update", "sudo apt install dos2unix", "dos2unix script.sh". После этого попробуйте выполнить скрипт снова. Если скрипт заработал, то выведется "Что куда копировать?: <директория-источник> <директория-назначение>". Отправьте нужную входящую и исходящию директорию командой ' ./script.sh "/mnt/расположение входной директории" "/mnt/расположение выходной директории" '. Как только скрипт скопирует все файлы, терминал вас оповестит.
