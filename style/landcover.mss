// --- Parks, woods, other green things ---

@grass: #cdebb0;        // Lch(90,32,128) also grassland, meadow, village_green, garden, allotments
@scrub: #c8d7ab;        // Lch(84,24,122)
@forest: #add19e;       // Lch(80,30,135)
@forest-text: #7dab6d;  // Lch(40,30,135)
@park: #e9f4d9;         // Lch(94,30,145)
@allotments: #c9e1bf;   // Lch(87,20,135)
@orchard: #aedfa3; // also vineyard, plant_nursery
@hedge: @forest;       // Lch(80,30,135)

// --- "Base" landuses ---

@built-up-lowzoom: #d0d0d0;
@built-up-z12: #f0eee4;
@residential: #f0eee4;      // Lch(89,0,0)
@residential-line: #b9b9b9; // Lch(75,0,0)
@retail: #e0dbc6;           // Lch(89,16,30)
@retail-line: #d99c95;      // Lch(70,25,30)
@commercial: #f2dad9;       // Lch(89,8.5,25)
@commercial-line: #d1b2b0;  // Lch(75,12,25)
@industrial: #ebdbe8;       // Lch(89,9,330) (Also used for railway, wastewater_plant)
@industrial-line: #c6b3c3;  // Lch(75,11,330) (Also used for railway-line, wastewater_plant-line)
@farmland: #eef0d5;         // Lch(94,14,112)
@farmland-line: #c7c9ae;    // Lch(80,14,112)
@farmyard: #f5dcba;         // Lch(89,20,80)
@farmyard-line: #d1b48c;    // Lch(75,25,80)

// --- Transport ----

@transportation-area: @contrast-color;
@apron: #dadae0;
@garages: #dfddce;
@parking: #eeeeee;
@parking-outline: saturate(darken(@parking, 40%), 20%);
@railway: @industrial;
@railway-line: @industrial-line;
@rest_area: #efc8c8; // also services

// --- Other ----

@bare_ground: #eee5dc;
@campsite: #def6c0; // also caravan_site, picnic_site
@cemetery: #72ba45; // also grave_yard
@construction: #c7c7b4; // also brownfield
@heath: #d6d99f;
@mud: rgba(203,177,154,0.3); // produces #e6dcd1 over @land
@place_of_worship: #d0d0d0; // also landuse_religious
@place_of_worship_outline: darken(@place_of_worship, 30%);
@leisure: lighten(@park, 5%);
@power: darken(@industrial, 5%);
@power-line: darken(@industrial-line, 5%);
@sand: #f5e9c6;
@societal_amenities: #ffffe5;   // Lch(99,13,109)
@tourism: #d776a6;
@quarry: #c5c3c3;
@military: #ff8080;
@beach: #fff1ba;
@wastewater_plant: @industrial;
@wastewater_plant-line: @industrial-line;
@water_works: @industrial;
@water_works-line: @industrial-line;

// --- Sports ---

@pitch: #aae0cb;           // Lch(85,22,168) also track
@track: @pitch;
@stadium: @leisure; // also sports_centre
@golf_course: #88cc00;

#landcover-low-zoom[zoom < 10],
#landcover[zoom >= 10] {
  ::low-zoom[zoom < 12] { image-filters: scale-hsla(0,1,0,1,0.2,1,0,1); }
  ::high-zoom[zoom >= 12]                 { image-filters: scale-hsla(0,1,0,1,0,  1,   0,1); }

  ::low-zoom[zoom < 12],
  ::high-zoom[zoom >= 12] {

  [feature = 'leisure_swimming_pool'][zoom >= 14] {
    polygon-fill: @land-color;
    [zoom >= 17] {
      line-width: 0.5;
      line-color: @water-color;
    }
  }

  [feature = 'leisure_recreation_ground'][zoom >= 10],
  [feature = 'landuse_recreation_ground'][zoom >= 10],
  [feature = 'leisure_playground'][zoom >= 13],
  [feature = 'leisure_fitness_station'][zoom >= 13] {
    polygon-fill: @land-color;
    [zoom >= 15] {
      line-color: @leisure;
      line-width: 0.3;
    }
  }

  [feature = 'tourism_camp_site'],
  [feature = 'tourism_caravan_site'],
  [feature = 'tourism_picnic_site'] {
    [zoom >= 10] {
      polygon-fill: @land-color;
      [zoom >= 13] {
        line-color: @campsite;
        line-width: 0.3;
      }
    }
  }

  [feature = 'amenity_place_of_worship'][zoom >= 13],
  [feature = 'landuse_religious'][zoom >= 13] {
    polygon-fill: @land-color;
    polygon-clip: false;
    [zoom >= 15] {
      line-color: @place_of_worship;
      line-width: 0.3;
      line-clip: false;
    }
  }

  [feature = 'leisure_ice_rink'][is_building = 'no'] {
    [zoom >= 10] {
      polygon-fill: @land-color;
      line-width: 0.5;
      line-color: @glacier;
    }
  }

  [feature = 'landuse_farmyard'][zoom >= 10] {
      polygon-fill: @land-color;
      [zoom >= 16] {
        line-width: 0.5;
        line-color: @farmyard;
        [name != ''] {
          line-width: 0.7;
        }
      }
  }

  [feature = 'landuse_retail'],
  [feature = 'shop_mall'],
  [feature = 'amenity_marketplace'] {
    [zoom >= 8] {
      polygon-fill: @land-color;
      [zoom >= 16] {
        line-width: 0.5;
        line-color: @retail;
        [name != ''] {
          line-width: 0.7;
        }
      }
    }
  }

  [feature = 'man_made_wastewater_plant'] {
    [zoom >= 16] {
      polygon-fill: @land-color;
      line-width: 0.5;
      line-color: @wastewater_plant;
      [name != ''] {
        line-width: 0.7;
      }
    }
  }

  [feature = 'man_made_water_works'] {
    [zoom >= 16] {
      polygon-fill: @land-color;
      line-width: 0.5;
      line-color: @water_works;
      [name != ''] {
        line-width: 0.7;
      }
    }
  }

  [feature = 'landuse_railway'][zoom >= 10] {
    [zoom >= 16][name != ''] {
      polygon-fill: @land-color;
      line-width: 0.7;
      line-color: @railway;
    }
  }

  [feature = 'power_plant'][zoom >= 10],
  [feature = 'power_generator'][zoom >= 10],
  [feature = 'power_substation'][zoom >= 13] {
    polygon-fill: @land-color;
    [zoom >= 16] {
      line-width: 0.5;
      line-color: @industrial;
      [name != ''] {
        line-width: 0.7;
      }
    }
  }

  [feature = 'amenity_clinic'],
  [feature = 'amenity_community_centre'],
  [feature = 'amenity_social_facility'],
  [feature = 'amenity_arts_centre'] {
    [zoom >= 13] {
      polygon-fill: @land-color;
      line-width: 0.3;
      line-color: @societal_amenities;
    }
  }

  [feature = 'amenity_fire_station'][zoom >= 8][way_pixels > 900],
  [feature = 'amenity_police'][zoom >= 8][way_pixels > 900],
  [feature = 'amenity_fire_station'][zoom >= 13],
  [feature = 'amenity_police'][zoom >= 13] {
    polygon-fill: @land-color;
    line-color: #d1927b;
//  line-opacity: 0.24;
    line-width: 1.0;
    line-offset: -0.5;
    [zoom >= 15] {
      line-width: 2;
      line-offset: -1.0;
    }
  }

  [feature = 'amenity_parking'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_taxi'] {
    [zoom >= 14] {
      polygon-fill: @land-color;
      [zoom >= 15] {
        line-width: 0.3;
        line-color: @parking;
      }
    }
  }

[feature = 'aeroway_aerodrome'][zoom >= 10],
  [feature = 'amenity_ferry_terminal'][zoom >= 15],
  [feature = 'amenity_bus_station'][zoom >= 15] {
    polygon-fill: @land-color;
    line-width: 0.2;
    line-color: @transportation-area;
  }

  [feature = 'leisure_sports_centre'],
  [feature = 'leisure_water_park'],
  [feature = 'leisure_stadium'] {
    [zoom >= 10] {
      polygon-fill: @land-color;
      [zoom >= 13] {
        line-width: 0.3;
        line-color: @stadium;
      }
    }
  }

  [feature = 'leisure_track'][zoom >= 10] {
    polygon-fill: @land-color;
    [zoom >= 15] {
      line-width: 0.5;
      line-color: @track;
    }
  }

  [feature = 'leisure_pitch'][zoom >= 10] {
    polygon-fill: @land-color;
    [zoom >= 15] {
      line-width: 0.5;
      line-color: @pitch;
    }
  }
}
}

#amenity-points {
  [feature = 'aeroway_apron'][zoom >= 10] {
    polygon-fill: @apron;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'aeroway_aerodrome'][zoom >= 10],
  [feature = 'amenity_ferry_terminal'][zoom >= 15],
  [feature = 'amenity_bus_station'][zoom >= 15] {
    polygon-fill: @transportation-area;
    line-width: 0.2;
    line-color: saturate(darken(@transportation-area, 40%), 20%);
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }
}
