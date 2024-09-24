
$('body').on('input', '.numinput', function() {
this.value = this.value.replace(/(?!^-)[^0-9.]/g, "").replace(/(\..*)\./g, '$1');
});

$('body').on('change', '.numinput', function() {
if(this.value == '-' || this.value == '-.' || this.value == '.'){
this.value = '';
}
});

