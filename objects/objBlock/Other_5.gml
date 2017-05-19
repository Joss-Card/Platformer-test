///Free list memory
if (ds_exists(stuck, ds_type_list))
{
    ds_list_destroy(stuck);
}
if (ds_exists(on_top, ds_type_list))
{
    ds_list_destroy(on_top);
}



