
#include <string.h>

#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"


void app_main() {
    esp_rom_gpio_pad_select_gpio(3);
    gpio_set_direction(3, GPIO_MODE_OUTPUT);
        
    gpio_set_level(3, 0);
    vTaskDelay(2000 / portTICK_PERIOD_MS);
    gpio_set_level(3, 1);
    vTaskDelay(1000 / portTICK_PERIOD_MS);
    gpio_set_level(3, 0);
}