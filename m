Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F978CDE026
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Sep 2024 17:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132FE10EBBA;
	Thu, 26 Sep 2024 17:22:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D8710EBBA;
 Thu, 26 Sep 2024 17:22:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/bios=3A_Ref?=
 =?utf-8?q?actor_ROM_access_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 26 Sep 2024 17:22:49 -0000
Message-ID: <172737136900.1107989.663753020292170294@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923152453.11230-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240923152453.11230-1-ville.syrjala@linux.intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/bios: Refactor ROM access (rev2)
URL   : https://patchwork.freedesktop.org/series/138477/
State : warning

== Summary ==

Error: dim checkpatch failed
8b4f246ee508 drm/i915/bios: Use drm_dbg_kms() consistently
a487ab653835 drm/i915/bios: Add some size checks to SPI VBT read
664b7ac3b855 drm/i915/bios: Round PCI ROM VBT allocation to multiple of 4
b27eed83d56e drm/i915/bios: Extract intel_spi_read16()
cb8dcdb7d0b0 drm/i915/bios: Extract vbt_signature[]
2c6278f1c120 drm/i915/bios: Extract soc/intel_rom.c
-:249: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#249: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 412 lines checked


