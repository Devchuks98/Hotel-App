class AvailableRoom {
  final String image;
  final String title;
  final String description;
  final double rating;
  final String price;

  AvailableRoom({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  });
}

final List<AvailableRoom> suites = [
  AvailableRoom(
    image: 'assets/images/rm1.jpeg',
    title: 'Luxury Suite',
    description: 'Luxurious suite with ocean view',
    rating: 5.0,
    price: '\$500',
  ),
  AvailableRoom(
    image: 'assets/images/rm4.jpeg',
    title: 'Executive Suite',
    description: 'Spacious executive suite',
    rating: 4.8,
    price: '\$450',
  ),
  AvailableRoom(
    image: 'assets/images/rm3.jpeg',
    title: 'Luxury Suite',
    description: 'Luxurious suite with ocean view',
    rating: 5.0,
    price: '\$500',
  ),
  AvailableRoom(
    image: 'assets/images/rm2.jpeg',
    title: 'Executive Suite',
    description: 'Spacious executive suite',
    rating: 4.8,
    price: '\$450',
  ),
];

final List<AvailableRoom> deluxeRooms = [
  AvailableRoom(
    image: 'assets/images/rm3.jpeg',
    title: 'Deluxe Room',
    description: 'Comfortable deluxe room',
    rating: 4.5,
    price: '\$200',
  ),
  AvailableRoom(
    image: 'assets/images/rm2.jpeg',
    title: 'Deluxe Double Room',
    description: 'Spacious deluxe double room',
    rating: 4.7,
    price: '\$220',
  ),
  AvailableRoom(
    image: 'assets/images/rm1.jpeg',
    title: 'Luxury Suite',
    description: 'Luxurious suite with ocean view',
    rating: 5.0,
    price: '\$500',
  ),
  AvailableRoom(
    image: 'assets/images/rm4.jpeg',
    title: 'Executive Suite',
    description: 'Spacious executive suite',
    rating: 4.8,
    price: '\$450',
  ),
];

final List<AvailableRoom> standardRooms = [
  AvailableRoom(
    image: 'assets/images/rm4.jpeg',
    title: 'Standard Room',
    description: 'Cozy standard room',
    rating: 4.0,
    price: '\$100',
  ),
  AvailableRoom(
    image: 'assets/images/rm2.jpeg',
    title: 'Standard Twin Room',
    description: 'Standard twin room',
    rating: 4.2,
    price: '\$120',
  ),
  AvailableRoom(
    image: 'assets/images/rm3.jpeg',
    title: 'Luxury Suite',
    description: 'Luxurious suite with ocean view',
    rating: 5.0,
    price: '\$500',
  ),
  AvailableRoom(
    image: 'assets/images/rm1.jpeg',
    title: 'Executive Suite',
    description: 'Spacious executive suite',
    rating: 4.8,
    price: '\$450',
  ),
];
