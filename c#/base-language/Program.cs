using System;
// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");

// Read lines from the console
Console.WriteLine("Enter your name:");
string? userName = Console.ReadLine();

// Libraries
Random dice = new();
int roll = dice.Next(1, 7);
int roll2 = dice.Next(1, 10);

if (roll > roll2)
{
    Console.WriteLine("Roll 1 is higher than roll 2");
} else {
    Console.WriteLine("Roll 2 is higher than roll 1");
}

Console.WriteLine($"Hey there {userName}, and your roll dice was {roll} and the second one was {roll2}, {Math.Max(roll, roll2)} was the highest roll");


string[] pallets = { "B14", "A11", "B12", "A13" };
Console.WriteLine("");

Array.Clear(pallets, 0, 2);
Console.WriteLine($"Clearing 2 ... count: {pallets.Length}");
foreach (var pallet in pallets)
{
    Console.WriteLine($"-- {pallet}");
}