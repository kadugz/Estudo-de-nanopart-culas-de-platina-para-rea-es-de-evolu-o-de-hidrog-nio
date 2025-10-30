from ase.io import read, write

all_configs = read('espresso.pwo', index=':')
initial_atoms = all_configs[0]
final_atoms = all_configs[-1]

write('relaxed.xyz', final_atoms, format='xyz')
write('initial.xyz', initial_atoms, format='xyz')
write('relaxed.cif', final_atoms)
