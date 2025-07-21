# NQA Token – Nguyen Quoc Anh ERC20

`NQA` là một smart contract token theo chuẩn ERC20, được xây dựng bằng OpenZeppelin với khả năng **mint**, **burn**, và **giới hạn tổng cung**. 
---

## ✅ Thông tin cơ bản

- **Tên token:** Nguyen Quoc Anh
- **Mã token (symbol):** NQA
- **Chuẩn:** ERC20 (Ethereum)
- **Framework:** OpenZeppelin Contracts v5.x
- **Ngôn ngữ:** Solidity ^0.8.0

---

## 🚀 Tính năng chính

| Chức năng                | Mô tả                                                                 |
|--------------------------|----------------------------------------------------------------------|
| `mint(address, uint256)` | Chỉ `owner` được phép mint thêm token, với giới hạn tổng cung (`cap`)|
| `burn(uint256)`          | `owner` có thể huỷ (burn) token từ ví của chính mình                 |
| `setMaxTotalSupply()`    | `owner` có thể tăng tổng cung tối đa (không thể giảm)                |
| `withinSupplyCap`        | `modifier` đảm bảo mint không vượt `maxTotalSupply`                 |
| Sự kiện (`event`)        | Ghi log khi mint, burn, hoặc tăng cap (để tracking on-chain)         |

### Event
| Tên sự kiện            | Khi nào được emit                    |
| ---------------------- | --------------------------------------- |
| `TokenMinted(amount)`  | Khi owner mint thành công token         |
| `TokenBurned(amount)`  | Khi owner burn token từ ví của chính họ |
| `CapIncreased(newCap)` | Khi cap được tăng bởi owner             |

---

## ⚙️ Cấu trúc khởi tạo

Khi triển khai contract:

- Cung cấp một `initialCap` (tổng cung tối đa ban đầu).
- Tự động mint 10% tổng cung cho `owner` (người triển khai).


