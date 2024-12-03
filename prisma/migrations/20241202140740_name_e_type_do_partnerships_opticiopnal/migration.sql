/*
  Warnings:

  - You are about to drop the column `privateSaleQty` on the `LaunchInfo` table. All the data in the column will be lost.
  - You are about to drop the column `publicSaleQty` on the `LaunchInfo` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "LaunchInfo" DROP COLUMN "privateSaleQty",
DROP COLUMN "publicSaleQty";

-- AlterTable
ALTER TABLE "Partnership" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "type" DROP NOT NULL;
