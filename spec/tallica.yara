rule Metallica
{
    strings:
        $lemmy = "murder all, murder one"

    condition:
        $lemmy
}
