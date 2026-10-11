shift = 7
msg = "CyberVault{c43s4r_cr4ck3d} next step grab evidence dot img from the case files"
out = "".join(
chr((ord(ch) - 65 + shift) % 26 + 65) if ch.isupper()
else chr((ord(ch) - 97 + shift) % 26 + 97) if ch.islower()
else ch
for ch in msg)
print(out)
