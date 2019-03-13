#Returns RNA sequence that is transcribed from given DNA sequence
sub transcribe_to_RNA {

        my ($dna_sequence) = @_;

        #Storing counterparts
        %counterpart = (
                "A" => "U",
                "T" => "A",
                "G" => "C",
                "C" => "G"
        );


        $seq_length = length $dna_sequence;
        $rna_sequence = "";


        #Transcribing the DNA sequence
        for (my $i = 0; $i < $seq_length; $i++) {

                #Each time taking one DNA and writing its counterpart to RNA seqeunce
                $rna_sequence .= $counterpart{substr $dna_sequence, $i, 1};

        }

        return $rna_sequence;

}

sub generate_amino_acit_sequence {

        my ($rna_sequence) = @_;


        #Storing letter equivalents of codons in a hash variable
        %codon_letter = (
                "GCU" => "A",
                "GCC" => "A",
                "GCA" => "A",
                "GCG" => "A",
                "UGU" => "C",
                "UGC" => "C",
                "GAU" => "D",
                "GAC" => "D",
                "GAA" => "E",
                "GAG" => "E",
                "UUU" => "F",
                "UUC" => "F",
                "GGU" => "G",
                "GGC" => "G",
                "GGA" => "G",
                "GGG" => "G",
                "CAU" => "H",
                "CAC" => "H",
                "AUU" => "I",
                "AUC" => "I",
                "AUA" => "I",
                "AAA" => "K",
                "AAG" => "K",
                "UUA" => "L",
                "UUG" => "L",
                "CUU" => "L",
                "CUC" => "L",
                "CUA" => "L",
                "CUG" => "L",
                "AUG" => "M",
                "AAU" => "N",
                "AAC" => "N",
                "CCU" => "P",
                "CCC" => "P",
                "CCA" => "P",
                "CCG" => "P",
                "CAA" => "Q",
                "CAG" => "Q",
                "CGU" => "R",
                "CGC" => "R",
                "CGA" => "R",
                "CGG" => "R",
                "AGA" => "R",
                "AGG" => "R",
                "UCU" => "S",
                "UCC" => "S",
                "UCA" => "S",
                "UCG" => "S",
                "AGU" => "S",
                "AGC" => "S",
                "ACU" => "T",
                "ACC" => "T",
                "ACA" => "T",
                "ACG" => "T",
                "GUU" => "V",
                "GUC" => "V",
                "GUA" => "V",
                "GUG" => "V",
                "UGG" => "W",
                "UAU" => "Y",
                "UAC" => "Y"
        );

        $seq_length = length $rna_sequence;
        $amino_acit_sequence = "";

        for (my $i = 0; $i < $seq_length; $i += 3) {

                #Each time taking one triplet and mapping suitable amino acit letter
                $amino_acit_sequence .= $codon_letter{substr $rna_sequence, $i, 3};
        }


        return $amino_acit_sequence;

}






#Opening the input file
open INPUT, "input.txt" or die "Couldn't open the file!";

#Opening the output file
open OUTPUT, ">output.txt" or die "Couldn't open the file!";


#Reading the file
$dna_sequence = <INPUT>;



$rna_sequence = transcribe_to_RNA($dna_sequence);

print OUTPUT "RNA Sequence: ".$rna_sequence."\n";

$amino_acit_sequence = generate_amino_acit_sequence($rna_sequence);

print OUTPUT "Amino Acit Sequence: ".$amino_acit_sequence;
