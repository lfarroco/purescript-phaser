module Phaser.Graphics.Input.KeyCodes where

-- ## Key Codes ##
--
-- All keycodes are available here to allow importing only the needed ones
-- into the target app bundle
import Data.Foreign.EasyFFI (unsafeForeignFunction)
import Graphics.Phaser.ForeignTypes (KeyCode)

getKeyCode :: String -> KeyCode
getKeyCode = unsafeForeignFunction [ "code" ] "Phaser.Input.Keyboard.KeyCodes[code]"

backspace :: KeyCode
backspace = getKeyCode "BACKSPACE" -- 8

tab :: KeyCode
tab = getKeyCode "TAB" -- 9,

enter :: KeyCode
enter = getKeyCode "ENTER" -- 13,

shift :: KeyCode
shift = getKeyCode "SHIFT" -- 16,

ctrl :: KeyCode
ctrl = getKeyCode "CTRL" -- 17,

alt :: KeyCode
alt = getKeyCode "ALT" -- 18,

pause :: KeyCode
pause = getKeyCode "PAUSE" -- 19,

caps_lock :: KeyCode
caps_lock = getKeyCode "CAPS_LOCK" -- 20,

esc :: KeyCode
esc = getKeyCode "ESC" -- 27,

space :: KeyCode
space = getKeyCode "SPACE" -- 32,

page_up :: KeyCode
page_up = getKeyCode "PAGE_UP" -- 33,

page_down :: KeyCode
page_down = getKeyCode "PAGE_DOWN" -- 34,

end :: KeyCode
end = getKeyCode "END" -- 35,

home :: KeyCode
home = getKeyCode "HOME" -- 36,

left :: KeyCode
left = getKeyCode "LEFT" -- 37,

up :: KeyCode
up = getKeyCode "UP" -- 38,

right :: KeyCode
right = getKeyCode "RIGHT" -- 39,

down :: KeyCode
down = getKeyCode "DOWN" -- 40,

print_screen :: KeyCode
print_screen = getKeyCode "PRINT_SCREEN" -- 42,

insert :: KeyCode
insert = getKeyCode "INSERT" -- 45,

delete :: KeyCode
delete = getKeyCode "DELETE" -- 46,

zero :: KeyCode
zero = getKeyCode "ZERO" -- 48,

one :: KeyCode
one = getKeyCode "ONE" -- 49,

two :: KeyCode
two = getKeyCode "TWO" -- 50,

three :: KeyCode
three = getKeyCode "THREE" -- 51,

four :: KeyCode
four = getKeyCode "FOUR" -- 52,

five :: KeyCode
five = getKeyCode "FIVE" -- 53,

six :: KeyCode
six = getKeyCode "SIX" -- 54,

seven :: KeyCode
seven = getKeyCode "SEVEN" -- 55,

eight :: KeyCode
eight = getKeyCode "EIGHT" -- 56,

nine :: KeyCode
nine = getKeyCode "NINE" -- 57,

numpad_zero :: KeyCode
numpad_zero = getKeyCode "NUMPAD_ZERO" -- 96,

numpad_one :: KeyCode
numpad_one = getKeyCode "NUMPAD_ONE" -- 97,

numpad_two :: KeyCode
numpad_two = getKeyCode "NUMPAD_TWO" -- 98,

numpad_three :: KeyCode
numpad_three = getKeyCode "NUMPAD_THREE" -- 99,

numpad_four :: KeyCode
numpad_four = getKeyCode "NUMPAD_FOUR" -- 100,

numpad_five :: KeyCode
numpad_five = getKeyCode "NUMPAD_FIVE" -- 101,

numpad_six :: KeyCode
numpad_six = getKeyCode "NUMPAD_SIX" -- 102,

numpad_seven :: KeyCode
numpad_seven = getKeyCode "NUMPAD_SEVEN" -- 103,

numpad_eight :: KeyCode
numpad_eight = getKeyCode "NUMPAD_EIGHT" -- 104,

numpad_nine :: KeyCode
numpad_nine = getKeyCode "NUMPAD_NINE" -- 105,

numpad_add :: KeyCode
numpad_add = getKeyCode "NUMPAD_ADD" -- 107,

numpad_subtract :: KeyCode
numpad_subtract = getKeyCode "NUMPAD_SUBTRACT" -- 109,

a :: KeyCode
a = getKeyCode "A" --  65,

b :: KeyCode
b = getKeyCode "B" --  66,

c :: KeyCode
c = getKeyCode "C" --  67,

d :: KeyCode
d = getKeyCode "D" --  68,

e :: KeyCode
e = getKeyCode "E" --  69,

f :: KeyCode
f = getKeyCode "F" --  70,

g :: KeyCode
g = getKeyCode "G" --  71,

h :: KeyCode
h = getKeyCode "H" --  72,

i :: KeyCode
i = getKeyCode "I" --  73,

j :: KeyCode
j = getKeyCode "J" --  74,

k :: KeyCode
k = getKeyCode "K" --  75,

l :: KeyCode
l = getKeyCode "L" --  76,

m :: KeyCode
m = getKeyCode "M" --  77,

n :: KeyCode
n = getKeyCode "N" --  78,

o :: KeyCode
o = getKeyCode "O" --  79,

p :: KeyCode
p = getKeyCode "P" --  80,

q :: KeyCode
q = getKeyCode "Q" --  81,

r :: KeyCode
r = getKeyCode "R" --  82,

s :: KeyCode
s = getKeyCode "S" --  83,

t :: KeyCode
t = getKeyCode "T" --  84,

u :: KeyCode
u = getKeyCode "U" --  85,

v :: KeyCode
v = getKeyCode "V" --  86,

w :: KeyCode
w = getKeyCode "W" --  87,

x :: KeyCode
x = getKeyCode "X" --  88,

y :: KeyCode
y = getKeyCode "Y" --  89,

z :: KeyCode
z = getKeyCode "Z" --  90,

f1 :: KeyCode
f1 = getKeyCode "F1" -- 112,

f2 :: KeyCode
f2 = getKeyCode "F2" -- 113,

f3 :: KeyCode
f3 = getKeyCode "F3" -- 114,

f4 :: KeyCode
f4 = getKeyCode "F4" -- 115,

f5 :: KeyCode
f5 = getKeyCode "F5" -- 116,

f6 :: KeyCode
f6 = getKeyCode "F6" -- 117,

f7 :: KeyCode
f7 = getKeyCode "F7" -- 118,

f8 :: KeyCode
f8 = getKeyCode "F8" -- 119,

f9 :: KeyCode
f9 = getKeyCode "F9" -- 120,

f10 :: KeyCode
f10 = getKeyCode "F10" -- 121,

f11 :: KeyCode
f11 = getKeyCode "F11" -- 122,

f12 :: KeyCode
f12 = getKeyCode "F12" -- 123,

semicolon :: KeyCode
semicolon = getKeyCode "SEMICOLON" -- 186,

plus :: KeyCode
plus = getKeyCode "PLUS" -- 187,

comma :: KeyCode
comma = getKeyCode "COMMA" -- 188,

minus :: KeyCode
minus = getKeyCode "MINUS" -- 189,

period :: KeyCode
period = getKeyCode "PERIOD" -- 190,

forward_slash :: KeyCode
forward_slash = getKeyCode "FORWARD_SLASH" -- 191,

back_slash :: KeyCode
back_slash = getKeyCode "BACK_SLASH" -- 220,

quotes :: KeyCode
quotes = getKeyCode "QUOTES" -- 222,

backtick :: KeyCode
backtick = getKeyCode "BACKTICK" -- 192,

open_bracket :: KeyCode
open_bracket = getKeyCode "OPEN_BRACKET" -- 219,

closed_bracket :: KeyCode
closed_bracket = getKeyCode "CLOSED_BRACKET" -- 221,

colon :: KeyCode
colon = getKeyCode "COLON" -- 58,

comma_firefox_windows :: KeyCode
comma_firefox_windows = getKeyCode "COMMA_FIREFOX_WINDOWS" -- 60,

comma_firefox :: KeyCode
comma_firefox = getKeyCode "COMMA_FIREFOX" -- 62,

bracket_right_firefox :: KeyCode
bracket_right_firefox = getKeyCode "BRACKET_RIGHT_FIREFOX" -- 174,

bracket_left_firefox :: KeyCode
bracket_left_firefox = getKeyCode "BRACKET_LEFT_FIREFOX" -- 175
