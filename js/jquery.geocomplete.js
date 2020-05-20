/*!
 * jquery.geocomplete v1.2.0 (https://github.com/tmentink/jquery.geocomplete)
 * Copyright 2017 Trent Mentink
 * Licensed under MIT
 */

function _classCallCheck(instance, Constructor) {
  if (!(instance instanceof Constructor)) {
    throw new TypeError("Cannot call a class as a function");
  }
}

if (typeof jQuery === "undefined" && typeof $ === "undefined") {
  throw new Error("jQuery is required.");
}

if (typeof google === "undefined" || typeof google.maps === "undefined" || typeof google.maps.places === "undefined") {
  throw new Error("Google Maps JavaScript API v3 with Places libary is required.");
}

!function($) {
  "use strict";
  var NAME = "geocomplete";
  var DATA_KEY = "gmap." + NAME;
  var EVENT_KEY = "." + DATA_KEY;
  var Settings = {
    appendToParent: true,
    fields: null,
    geolocate: false,
    map: null,
    types: [ "geocode" ],
    onChange: function onChange() {},
    onNoResult: function onNoResult() {}
  };
  var Event = {
    FOCUS: "focus" + EVENT_KEY,
    PLACE_CHANGED: "place_changed"
  };
  var AddressFunctions = {
    city: function city(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "locality"
      });
    },
    country: function country(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "country"
      });
    },
    county: function county(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "administrative_area_level_2"
      });
    },
    formattedaddress: function formattedaddress(details) {
      return details["formatted_address"];
    },
    neighborhood: function neighborhood(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "neighborhood"
      });
    },
    state: function state(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "administrative_area_level_1"
      });
    },
    street: function street(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "route"
      });
    },
    streetaddress: function streetaddress(details, short) {
      var number = _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "street_number"
      });
      var street = _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "route"
      });
      return number + " " + street;
    },
    streetnumber: function streetnumber(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "street_number"
      });
    },
    zipcode: function zipcode(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "postal_code"
      });
    },
    zipcodesuffix: function zipcodesuffix(details, short) {
      return _getAddressValue({
        placeAddress: details["address_components"],
        name: short ? "short_name" : "long_name",
        type: "postal_code_suffix"
      });
    }
  };
  var FieldFunctions = {
    clear: {
      INPUT: function INPUT($field) {
        $field.val("");
      },
      SELECT: function SELECT($field) {
        $field.val("");
      },
      SEMANTIC_DROPDOWN: function SEMANTIC_DROPDOWN($field) {
        $field.dropdown("clear");
      }
    },
    set: {
      INPUT: function INPUT($field, value) {
        $field.val(value);
      },
      SELECT: function SELECT($field, value) {
        var index = $("option:contains(" + value + ")", $field)[0].index;
        $field.prop("selectedIndex", index);
      },
      SEMANTIC_DROPDOWN: function SEMANTIC_DROPDOWN($field, value) {
        $field.dropdown("set selected", value);
      }
    }
  };
  var Index = -1;
  var StyleSheet = _createStyleSheet();
  var Geocomplete = function() {
    function Geocomplete(element, settings) {
      var _this = this;
      _classCallCheck(this, Geocomplete);
      if (typeof settings === "string") {
        settings = {};
      }
      settings = $.extend(true, {}, $.fn[NAME].settings, settings);
      this.element = element;
      this.fields = settings.fields;
      this.index = Index += 1;
      this.map = settings.map;
      this.obj = new google.maps.places.Autocomplete(element, settings);
      this.pacContainer = null;
      this.obj.addListener(Event.PLACE_CHANGED, function() {
        var $element = $(_this.element);
        var placeDetails = _this.getplace();
        if (_isEmptyResult(placeDetails)) {
          settings.onNoResult.call($element, placeDetails.name);
        } else {
          settings.onChange.call($element, placeDetails.name, placeDetails);
          if (_this.fields != null) {
            _this.fillfields();
          }
          if (_this.map != null) {
            var location = placeDetails.geometry.location;
            var viewport = placeDetails.geometry.viewport;
            _this.centermap(location || viewport);
          }
        }
      });
      if (settings.geolocate) {
        _geoLocate(this.obj);
      }
      if (settings.appendToParent) {
        $(element).on(Event.FOCUS, function() {
          var $element = $(this);
          var geo = $element.data(DATA_KEY);
          if (geo.pacContainer != null) {
            _appendContainer($element, geo.pacContainer);
            $element.off(Event.FOCUS);
          }
        });
        setTimeout(function() {
          _this.pacContainer = $(".pac-container")[_this.index];
        }, 1e3);
      }
    }
    Geocomplete.prototype.centermap = function centermap(bounds) {
      if (bounds == null) {
        var details = this.getplace();
        var location = details.geometry.location;
        var viewport = details.geometry.viewport;
        bounds = viewport || location;
      }
      if (bounds instanceof google.maps.LatLngBounds) {
        this.map.fitBounds(bounds);
      } else if (bounds instanceof google.maps.LatLng) {
        this.map.setCenter(bounds);
      }
      return $(this.element);
    };
    Geocomplete.prototype.clearfields = function clearfields() {
      var fields = this.fields;
      if ($.type(fields) == "string") {
        $("[data-" + NAME + "]", $(this.fields)).each(function() {
          var $field = $(this);
          FieldFunctions.clear[_getFieldType($field)]($field);
        });
      } else if ($.type(fields) == "object") {
        for (var id in fields) {
          var $field = $(id);
          if ($field.length == 0) {
            _throwError(id + " was not found in DOM");
            continue;
          }
          FieldFunctions.clear[_getFieldType($field)]($field);
        }
      }
      return $(this.element);
    };
    Geocomplete.prototype.fillfields = function fillfields() {
      this.clearfields();
      var fields = this.fields;
      var placeDetails = this.obj.getPlace();
      if ($.type(fields) == "string") {
        $("[data-" + NAME + "]", $(this.fields)).each(function() {
          var $field = $(this);
          var addressType = $field.data(NAME);
          _setFieldValue($field, addressType, placeDetails);
        });
      } else if ($.type(fields) == "object") {
        for (var id in fields) {
          var $field = $(id);
          var addressType = fields[id];
          if ($field.length == 0) {
            _throwError(id + " was not found in DOM");
            continue;
          }
          _setFieldValue($field, addressType, placeDetails);
        }
      }
      return $(this.element);
    };
    Geocomplete.prototype.getbounds = function getbounds() {
      return this.obj.getBounds();
    };
    Geocomplete.prototype.getplace = function getplace() {
      return this.obj.getPlace();
    };
    Geocomplete.prototype.setbounds = function setbounds(parms) {
      this.obj.setBounds(parms);
      return $(this.element);
    };
    Geocomplete.prototype.setcomponentrestrictions = function setcomponentrestrictions(parms) {
      this.obj.setComponentRestrictions(parms);
      return $(this.element);
    };
    Geocomplete.prototype.setoptions = function setoptions(parms) {
      this.obj.setOptions(parms);
      return $(this.element);
    };
    Geocomplete.prototype.settypes = function settypes(parms) {
      this.obj.setTypes(parms);
      return $(this.element);
    };
    Geocomplete._jQueryInterface = function _jQueryInterface(settings, parms) {
      var $element = $(this);
      var geo = $element.data(DATA_KEY);
      if (!geo) {
        geo = new Geocomplete(this[0], settings);
        $element.data(DATA_KEY, geo);
      }
      if (typeof settings === "string") {
        var method = settings.toLowerCase().replace(/\s+/g, "");
        if (geo[method]) {
          return geo[method](parms);
        } else {
          _throwError('"' + settings + '" is not a valid method');
        }
      }
      return this;
    };
    return Geocomplete;
  }();
  function _appendContainer($element, $pacContainer) {
    var left = _calcLeftPosition($element) + "px !important";
    var top = _calcTopPosition($element) + "px !important";
    $pacContainer.id = "pac-container_" + $element[0].id;
    StyleSheet.innerHTML += "#" + $pacContainer.id + "{top:" + top + "; left:" + left + ";}";
    $element.parent().css({
      position: "relative"
    }).append($pacContainer);
  }
  function _calcLeftPosition($element) {
    var element_left = $element.offset().left;
    var parent_left = $element.parent().offset().left;
    return element_left - parent_left;
  }
  function _calcTopPosition($element) {
    var element_top = $element.offset().top;
    var element_height = $element.outerHeight();
    var parent_top = $element.parent().offset().top;
    return element_top - parent_top + element_height;
  }
  function _createStyleSheet() {
    var style = document.createElement("style");
    style.type = "text/css";
    $("head")[0].appendChild(style);
    return style;
  }
  function _geoLocate(obj) {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var circle = new google.maps.Circle({
          center: {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          },
          radius: position.coords.accuracy
        });
        obj.setBounds(circle.getBounds());
      });
    }
  }
  function _getAddressValue(parms) {
    var placeAddress = parms.placeAddress || [];
    var name = parms.name;
    var type = parms.type;
    var i = placeAddress.map(function(address) {
      return address.types[0] == type;
    }).indexOf(true);
    return i != -1 ? placeAddress[i][name] : "";
  }
  function _getFieldType($field) {
    return _isSemanticDropdown($field) ? "SEMANTIC_DROPDOWN" : $field.prop("nodeName");
  }
  function _isEmptyResult(placeDetails) {
    return Object.keys(placeDetails).length <= 1;
  }
  function _isSemanticDropdown($field) {
    var $parent = $field.parent();
    if ($field.hasClass("ui") && $field.hasClass("dropdown") || $parent.hasClass("ui") && $parent.hasClass("dropdown")) {
      return true;
    }
    return false;
  }
  function _setFieldValue($field, addressType, placeDetails) {
    addressType = addressType.toLowerCase().replace(/\s+/g, "");
    var short = addressType.indexOf("short") != -1;
    addressType = addressType.replace("short", "");
    if (AddressFunctions[addressType]) {
      var value = AddressFunctions[addressType](placeDetails, short);
      FieldFunctions.set[_getFieldType($field)]($field, value);
    } else {
      _throwError(addressType + " is not a valid address type");
    }
  }
  function _throwError(message) {
    console.error(message);
  }
  $.fn[NAME] = Geocomplete._jQueryInterface;
  $.fn[NAME].Constructor = Geocomplete;
  $.fn[NAME].settings = Settings;
  return $;
}(window.jQuery || window.$);
