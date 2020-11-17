Return-Path: <SRS0=Ur01=EX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CC8C6369E
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 02:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7652C24692
	for <intel-gfx@archiver.kernel.org>; Tue, 17 Nov 2020 02:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7652C24692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA416E0DC;
	Tue, 17 Nov 2020 02:54:01 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7A46E0DC;
 Tue, 17 Nov 2020 02:54:00 +0000 (UTC)
IronPort-SDR: sMdJkm68jHMtGV64N9CGoZWGrYSWzma3vBdnsva6mqZBHYsltK/A5dpxdT6yqNFCQe5n5U/U+J
 I24uEG4KVVMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="188904463"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
 d="asc'?scan'208";a="188904463"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 18:53:50 -0800
IronPort-SDR: juYwcmBhWqBjBcHAiQ0+BmF6pTQgfGBt45xQtNVjpl3jtibp0M/szGE/RtoovN1V/nYWBpQ325
 UXHA10xMCGuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
 d="asc'?scan'208";a="358709560"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2020 18:53:47 -0800
Date: Tue, 17 Nov 2020 10:39:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Message-ID: <20201117023918.GB23899@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PULL] gvt-fixes
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============1509059198=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============1509059198==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's more gvt fixes for 5.10. It temporarily disables VFIO edid
feature on BXT/APL until its virtual display is really fixed to make
it work properly. And fixes for DPCD 1.2 and error return in taking
module reference.

Thanks
--
The following changes since commit 92010a97098c4c9fd777408cc98064d26b32695b:

  drm/i915/gvt: Fix mmio handler break on BXT/APL. (2020-10-30 11:50:06 +08=
00)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-11-17

for you to fetch changes up to 4ec2b69da5e1544dbadb30cddb49c8df60209b0c:

  drm/i915/gvt: return error when failing to take the module reference (202=
0-11-13 12:16:52 +0800)

----------------------------------------------------------------
gvt-fixes-2020-11-17

- Temporarily disable VFIO edid on BXT/APL (Colin)
- Fix emulated DPCD for version 1.2 (Tina)
- Fix error return when failing to take module reference (Xiongfeng)

----------------------------------------------------------------
Colin Xu (1):
      drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL

Tina Zhang (1):
      drm/i915/gvt: Set ENHANCED_FRAME_CAP bit

Xiongfeng Wang (1):
      drm/i915/gvt: return error when failing to take the module reference

 drivers/gpu/drm/i915/gvt/display.c | 2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c   | 4 +++-
 drivers/gpu/drm/i915/gvt/vgpu.c    | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX7M3zwAKCRCxBBozTXgY
JytHAJ0btP8+P3WCnh73lciq4cEXns+7EACeKb2XoYw/LhPiRNUVq7PxKK2To2Y=
=SHWC
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--

--===============1509059198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1509059198==--
