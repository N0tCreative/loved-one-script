$global:name = "Toby"; #insert name here
$global:symbol ="@";
$global:genericAffermations = @( 
    "I love you"
    "You're cute"
    "I miss you"
    "I want to spend all night in your arms"
    "I cant wait to see you again"
    "I love your smile"
    "You're so sweet"
    "You make me so happy"

);
#add affermations specific to your partner
$global:specificAffermations =@(

);
$chosenAffermation = "";
$max = $global:genericAffermations.Count + $global:specificAffermations.Count;
$index = Get-Random -Minimum 0 -Maximum $max;
#treat index as if it was indexing for an array containing both global and specific affermations
if ($index -ge $global:specificAffermations.Count){
    $index -=$global:specificAffermations.Count;
    $chosenAffermation = $global:genericAffermations[$index];
}else{
    $chosenAffermation = $global:specificAffermations[$index];
}

#this is the line that contains the words of affermation and the partners name
$commentLine = $global:symbol + " " + $chosenAffermation + " " + $global:name + " " +$global:symbol;

$numberOfHearts = [int]($commentLine.Length/4);
$numberOfSpaces = [int]($commentLine.Length/8);

#generate top of heart
while($numberOfSpaces -gt 0){
    #generate both sides
    $outterSpace = " " * $numberOfSpaces;
    $innerSpace= " " * ($commentLine.Length - ($numberOfHearts*2 + $numberOfSpaces*2));#+1 is because it is odd (maybe replace with +isOdd)
    $innerHeart = $global:symbol * $numberOfHearts;
    #makes the center an odd number
    Write-Output ($outterSpace + $innerHeart + $innerSpace + $innerHeart + $outterSpace);
    $numberOfSpaces -=1;
    $numberOfHearts +=2;
}

$numberOfHearts = $commentLine.Length;
$numberOfSpaces = 0;

#generate middle of heart
$innerHeart = $global:symbol * $numberOfHearts;
Write-Output $innerHeart;
Write-Output $commentLine;

#generate bottom of heart
while ($numberOfHearts -gt 0){
    $outterSpace = " " * $numberOfSpaces;
    $innerHeart = $global:symbol * $numberOfHearts;
    Write-Output ($outterSpace + $innerHeart + $outterSpace);
    $numberOfSpaces +=1;
    $numberOfHearts -=2;
}
