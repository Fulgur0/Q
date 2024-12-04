<?php

$file = 'start.q';

function execute($file)
{
    $content = explode(";", preg_replace('/\[.*?\]/', '', str_replace("\n", '', str_replace(' ', '', file_get_contents('src/' . $file)))));

    $task = "";
    $stack = "";
    foreach ($content as $i) {
        switch ($task) {
            case "":
                $task = $i;
                break;
            case "q":
                $char = str_split($i, 5);
                $charStack = "";
                foreach ($char as $c) {
                    switch ($c) {
                        case "qQQQQ":
                            $charStack .= "1";
                            break;
                        case "qqQQQ":
                            $charStack .= "2";
                            break;
                        case "qqqQQ":
                            $charStack .= "3";
                            break;
                        case "qqqqQ":
                            $charStack .= "4";
                            break;
                        case "qqqqq":
                            $charStack .= "5";
                            break;
                        case "Qqqqq":
                            $charStack .= "6";
                            break;
                        case "QQqqq":
                            $charStack .= "7";
                            break;
                        case "QQQqq":
                            $charStack .= "8";
                            break;
                        case "QQQQq":
                            $charStack .= "9";
                            break;
                        case "QQQQQ":
                            $charStack .= "0";
                            break;
                        case "q":
                            $task = "";
                            $stack .= mb_chr((int)$charStack, "UTF-8");
                            break;
                    }
                }
                break;
            case "qq": // print stack
                echo $stack;
                $task = "";
                break;
            case "QQ": // clear stack
                $stack = "";
                $task = "";
                break;
            case "Qqq": // compile assembly stack
                file_put_contents("build/" . $file . '.asm', $stack);
                exec("nasm -f elf32 -o build/" . $file . " build/" . $file . '.asm');
                $task = "";
                break;
            case "QQq":
                execute($stack);
                $task = "";
                break;
            case "Qqqq": // link assembly stack
                exec("ld -m elf_i386 " . $stack . " -o start");
                break;
        }
    }
}

execute($file);
