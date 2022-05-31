module Phaser.Graphics.Input.KeyCodes where

-- ## Key Codes ##
--
-- All keycodes are available here to allow importing only the needed ones
-- into the target app bundle
import Prelude
import Effect (Effect)
import Graphics.Phaser.ForeignTypes (KeyCode)
import Utils.FFI (_getProp, phaser)

getKeyCode :: String -> Effect KeyCode
getKeyCode code =
  phaser
    >>= _getProp "Input"
    >>= _getProp "Keyboard"
    >>= _getProp "KeyCodes"
    >>= _getProp code

backspace :: Effect KeyCode
backspace = getKeyCode "BACKSPACE" -- 8

tab :: Effect KeyCode
tab = getKeyCode "TAB" -- 9,

enter :: Effect KeyCode
enter = getKeyCode "ENTER" -- 13,

shift :: Effect KeyCode
shift = getKeyCode "SHIFT" -- 16,

ctrl :: Effect KeyCode
ctrl = getKeyCode "CTRL" -- 17,

alt :: Effect KeyCode
alt = getKeyCode "ALT" -- 18,

pause :: Effect KeyCode
pause = getKeyCode "PAUSE" -- 19,

caps_lock :: Effect KeyCode
caps_lock = getKeyCode "CAPS_LOCK" -- 20,

esc :: Effect KeyCode
esc = getKeyCode "ESC" -- 27,

space :: Effect KeyCode
space = getKeyCode "SPACE" -- 32,

page_up :: Effect KeyCode
page_up = getKeyCode "PAGE_UP" -- 33,

page_down :: Effect KeyCode
page_down = getKeyCode "PAGE_DOWN" -- 34,

end :: Effect KeyCode
end = getKeyCode "END" -- 35,

home :: Effect KeyCode
home = getKeyCode "HOME" -- 36,

left :: Effect KeyCode
left = getKeyCode "LEFT" -- 37,

up :: Effect KeyCode
up = getKeyCode "UP" -- 38,

right :: Effect KeyCode
right = getKeyCode "RIGHT" -- 39,

down :: Effect KeyCode
down = getKeyCode "DOWN" -- 40,

print_screen :: Effect KeyCode
print_screen = getKeyCode "PRINT_SCREEN" -- 42,

insert :: Effect KeyCode
insert = getKeyCode "INSERT" -- 45,

delete :: Effect KeyCode
delete = getKeyCode "DELETE" -- 46,

zero :: Effect KeyCode
zero = getKeyCode "ZERO" -- 48,

one :: Effect KeyCode
one = getKeyCode "ONE" -- 49,

two :: Effect KeyCode
two = getKeyCode "TWO" -- 50,

three :: Effect KeyCode
three = getKeyCode "THREE" -- 51,

four :: Effect KeyCode
four = getKeyCode "FOUR" -- 52,

five :: Effect KeyCode
five = getKeyCode "FIVE" -- 53,

six :: Effect KeyCode
six = getKeyCode "SIX" -- 54,

seven :: Effect KeyCode
seven = getKeyCode "SEVEN" -- 55,

eight :: Effect KeyCode
eight = getKeyCode "EIGHT" -- 56,

nine :: Effect KeyCode
nine = getKeyCode "NINE" -- 57,

numpad_zero :: Effect KeyCode
numpad_zero = getKeyCode "NUMPAD_ZERO" -- 96,

numpad_one :: Effect KeyCode
numpad_one = getKeyCode "NUMPAD_ONE" -- 97,

numpad_two :: Effect KeyCode
numpad_two = getKeyCode "NUMPAD_TWO" -- 98,

numpad_three :: Effect KeyCode
numpad_three = getKeyCode "NUMPAD_THREE" -- 99,

numpad_four :: Effect KeyCode
numpad_four = getKeyCode "NUMPAD_FOUR" -- 100,

numpad_five :: Effect KeyCode
numpad_five = getKeyCode "NUMPAD_FIVE" -- 101,

numpad_six :: Effect KeyCode
numpad_six = getKeyCode "NUMPAD_SIX" -- 102,

numpad_seven :: Effect KeyCode
numpad_seven = getKeyCode "NUMPAD_SEVEN" -- 103,

numpad_eight :: Effect KeyCode
numpad_eight = getKeyCode "NUMPAD_EIGHT" -- 104,

numpad_nine :: Effect KeyCode
numpad_nine = getKeyCode "NUMPAD_NINE" -- 105,

numpad_add :: Effect KeyCode
numpad_add = getKeyCode "NUMPAD_ADD" -- 107,

numpad_subtract :: Effect KeyCode
numpad_subtract = getKeyCode "NUMPAD_SUBTRACT" -- 109,

a :: Effect KeyCode
a = getKeyCode "A" --  65,

b :: Effect KeyCode
b = getKeyCode "B" --  66,

c :: Effect KeyCode
c = getKeyCode "C" --  67,

d :: Effect KeyCode
d = getKeyCode "D" --  68,

e :: Effect KeyCode
e = getKeyCode "E" --  69,

f :: Effect KeyCode
f = getKeyCode "F" --  70,

g :: Effect KeyCode
g = getKeyCode "G" --  71,

h :: Effect KeyCode
h = getKeyCode "H" --  72,

i :: Effect KeyCode
i = getKeyCode "I" --  73,

j :: Effect KeyCode
j = getKeyCode "J" --  74,

k :: Effect KeyCode
k = getKeyCode "K" --  75,

l :: Effect KeyCode
l = getKeyCode "L" --  76,

m :: Effect KeyCode
m = getKeyCode "M" --  77,

n :: Effect KeyCode
n = getKeyCode "N" --  78,

o :: Effect KeyCode
o = getKeyCode "O" --  79,

p :: Effect KeyCode
p = getKeyCode "P" --  80,

q :: Effect KeyCode
q = getKeyCode "Q" --  81,

r :: Effect KeyCode
r = getKeyCode "R" --  82,

s :: Effect KeyCode
s = getKeyCode "S" --  83,

t :: Effect KeyCode
t = getKeyCode "T" --  84,

u :: Effect KeyCode
u = getKeyCode "U" --  85,

v :: Effect KeyCode
v = getKeyCode "V" --  86,

w :: Effect KeyCode
w = getKeyCode "W" --  87,

x :: Effect KeyCode
x = getKeyCode "X" --  88,

y :: Effect KeyCode
y = getKeyCode "Y" --  89,

z :: Effect KeyCode
z = getKeyCode "Z" --  90,

f1 :: Effect KeyCode
f1 = getKeyCode "F1" -- 112,

f2 :: Effect KeyCode
f2 = getKeyCode "F2" -- 113,

f3 :: Effect KeyCode
f3 = getKeyCode "F3" -- 114,

f4 :: Effect KeyCode
f4 = getKeyCode "F4" -- 115,

f5 :: Effect KeyCode
f5 = getKeyCode "F5" -- 116,

f6 :: Effect KeyCode
f6 = getKeyCode "F6" -- 117,

f7 :: Effect KeyCode
f7 = getKeyCode "F7" -- 118,

f8 :: Effect KeyCode
f8 = getKeyCode "F8" -- 119,

f9 :: Effect KeyCode
f9 = getKeyCode "F9" -- 120,

f10 :: Effect KeyCode
f10 = getKeyCode "F10" -- 121,

f11 :: Effect KeyCode
f11 = getKeyCode "F11" -- 122,

f12 :: Effect KeyCode
f12 = getKeyCode "F12" -- 123,

semicolon :: Effect KeyCode
semicolon = getKeyCode "SEMICOLON" -- 186,

plus :: Effect KeyCode
plus = getKeyCode "PLUS" -- 187,

comma :: Effect KeyCode
comma = getKeyCode "COMMA" -- 188,

minus :: Effect KeyCode
minus = getKeyCode "MINUS" -- 189,

period :: Effect KeyCode
period = getKeyCode "PERIOD" -- 190,

forward_slash :: Effect KeyCode
forward_slash = getKeyCode "FORWARD_SLASH" -- 191,

back_slash :: Effect KeyCode
back_slash = getKeyCode "BACK_SLASH" -- 220,

quotes :: Effect KeyCode
quotes = getKeyCode "QUOTES" -- 222,

backtick :: Effect KeyCode
backtick = getKeyCode "BACKTICK" -- 192,

open_bracket :: Effect KeyCode
open_bracket = getKeyCode "OPEN_BRACKET" -- 219,

closed_bracket :: Effect KeyCode
closed_bracket = getKeyCode "CLOSED_BRACKET" -- 221,

colon :: Effect KeyCode
colon = getKeyCode "COLON" -- 58,

comma_firefox_windows :: Effect KeyCode
comma_firefox_windows = getKeyCode "COMMA_FIREFOX_WINDOWS" -- 60,

comma_firefox :: Effect KeyCode
comma_firefox = getKeyCode "COMMA_FIREFOX" -- 62,

bracket_right_firefox :: Effect KeyCode
bracket_right_firefox = getKeyCode "BRACKET_RIGHT_FIREFOX" -- 174,

bracket_left_firefox :: Effect KeyCode
bracket_left_firefox = getKeyCode "BRACKET_LEFT_FIREFOX" -- 175
