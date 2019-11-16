rule TheDillingerEscapePlan
{
    strings:
        $happiness = "is just a smile"

    condition:
        $happiness
}
