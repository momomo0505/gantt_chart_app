document.addEventListener('DOMContentLoaded', function() {
  const tooltips = document.querySelectorAll('.tooltip');
  tooltips.forEach(function(tooltip) {
    tooltip.addEventListener('mouseover', function() {
      const tooltiptext = this.querySelector('.tooltiptext');
      tooltiptext.style.visibility = 'visible';
    });
    tooltip.addEventListener('mouseout', function() {
      const tooltiptext = this.querySelector('.tooltiptext');
      tooltiptext.style.visibility = 'hidden';
    });
  });
});