/* ######################
 * ### solution
 * ######################
 */
db.catalogs.insertMany([
    { name: "Процессоры" },
    { name: "Материнские платы" },
    { name: "Видеокарты" },
    { name: "Жесткие диски" },
    { name: "Оперативная память" }
]);

db.products.insertMany([
    {
        name: "AMD FX-8320",
        desription: "Процессор для настольных персональных компьютеров, основанных на платформе AMD.",
        price: NumberDecimal("7120.00"),
        catalog_name: "Процессоры"
    },
    {
        name: "ASUS ROG MAXIMUS X HERO",
        desription: "Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX",
        price: NumberDecimal("19310.00"),
        catalog_name: "Материнские платы"
    }    
]);