function main()
    # Atoms
    atoms = Atoms( xyz_string_frac=
        """
        1

        Cu  0.0  0.0  0.0
        """, in_bohr=true,
        LatVecs = gen_lattice_fcc(3.61496*ANG2BOHR) )

    # Initialize Hamiltonian
    pspfiles = [joinpath(DIR_PSP, "Cu-q11.gth")]
    ecutwfc = 15.0
    Ham = Hamiltonian( atoms, pspfiles, ecutwfc,
                       meshk=[3,3,3], extra_states=4 )
    println(Ham)

    #
    # Solve the KS problem
    #
    KS_solve_SCF!( Ham, betamix=0.2, mix_method="anderson", NiterMax=50, use_smearing=true )

end

