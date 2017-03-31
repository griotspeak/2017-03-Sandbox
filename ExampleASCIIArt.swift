//
//  ExampleASCIIArt.swift
//  
//
//  Created by TJ Usiyan on 2017/03/27.
//
//


import Foundation
import Darwin

func clearScreen() {
    Process.launchedProcess(launchPath: "/usr/bin/clear", arguments: []).waitUntilExit()
}

clearScreen()
print("Hello")

sleep(2)
clearScreen()


sleep(3)
clearScreen()

print("That's nice")

sleep(3)
clearScreen()

print("Here is a line:")
print("------------------------------------------")
print()
sleep(3)
clearScreen()

print("Here is a vertical line:")
print("|")
print("|")
print("|")
print("|")
print("|")
print("|")
print("|")
print("|")
print("|")
print("|")
print("|")
print()
sleep(3)
clearScreen()

print("Here is a slanted line:")
print("\\")
print(" \\")
print("  \\")
print("   \\")
print("    \\")
print("     \\")
print("      \\")
print("       \\")
print("        \\")
print()

sleep(3)
clearScreen()

print("Here is a circle:")
print("   ooo   ")
print(" oo   oo")
print("o       o")
print(" oo   oo")
print("   ooo")
print()

sleep(3)
clearScreen()

print("Here is an X:")
print("\\       /")
print(" \\     /")
print("  \\   /")
print("   \\ /")
print("    \\")
print("   / \\")
print("  /   \\")
print(" /     \\")
print("/       \\")
print()


print("  o  ")
print("  |  ")
print("  |  ")
print("  \\  ")

print("                                            Λ")
print("                                           ╱ ╲")
print("                                          ╱   ╲")
print("                                         ╱     ╲")
print("                                        ╱       ╲")
print("                                       ╱         ╲")
print("                                      ╱           ╲")
print("                                     ╱             ╲")
print("                                    ╱               ╲")
print("                                   ╱                 ╲")
print("                                  ╱                   ╲")
print("                                 ▕                     ▏")
print("                                  ╲                   ╱")
print("                                   ╲                 ╱")
print("                                    ╲               ╱")
print("                                     ╲             ╱")
print("                                      ╲           ╱")
print("                                       ╲         ╱")
print("                                        ╲       ╱")
print("                                         ╲     ╱")
print("                                          ╲   ╱")
print("                                           ╲ ╱")
print("                                            V")




