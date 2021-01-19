Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25C7C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 23:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C872251D
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 23:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64C872251D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF386E042;
	Tue, 19 Jan 2021 23:57:21 +0000 (UTC)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075556E042;
 Tue, 19 Jan 2021 23:57:20 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DL5DY2223z9s2g;
 Wed, 20 Jan 2021 10:57:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1611100638;
 bh=aU6XNAzQbH3IDoetYyr1Fi183CHr/Mb4lTKH65/VU0o=;
 h=Date:From:To:Cc:Subject:From;
 b=Yj4HKl1AzKXbJ+uKLZfAtSLYrs9hb5aJ2Wqz8S8SEIBshqrwSmJ8j5eaamtwE6bfz
 jo0df5vZ/iGg8FJIHU/i8s+Z5FuwQJEe6ozl4Heb21YF6zIRAwlp7vLPt+4XBMA+p5
 XkCEUZmG40OUHVq/3NRCDt+8sK5IXiV+3yCS2/xRzb2LSWMOS42vdmaoWBpCw5KVet
 SA5uKfg5eQX7sDZ4nijP6GQiSu1Q3Xrn+wFV1lqlIBOF9X1p5f0WNNYBsMgHGkN6Sk
 bD8qEEzyThymTLpr5n84yTscnF3i2un6Bq6rX1m9R93B4lsOtQrsjVVsczq4bzkugb
 +9qDyU8eSf+Ag==
Date: Wed, 20 Jan 2021 10:57:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Message-ID: <20210120105715.4391dd95@canb.auug.org.au>
MIME-Version: 1.0
Subject: [Intel-gfx] linux-next: build failure after merge of the drm-intel
 tree
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1580378186=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============1580378186==
Content-Type: multipart/signed; boundary="Sig_/7BT8h2PLWsOJZo2F4=5Rm_T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7BT8h2PLWsOJZo2F4=5Rm_T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/msm/dp/dp_ctrl.c: In function 'dp_ctrl_use_fixed_nvid':
drivers/gpu/drm/msm/dp/dp_ctrl.c:1425:16: error: implicit declaration of fu=
nction 'drm_dp_get_edid_quirks'; did you mean 'drm_do_get_edid'? [-Werror=
=3Dimplicit-function-declaration]
 1425 |  edid_quirks =3D drm_dp_get_edid_quirks(ctrl->panel->edid);
      |                ^~~~~~~~~~~~~~~~~~~~~~
      |                drm_do_get_edid
drivers/gpu/drm/msm/dp/dp_ctrl.c:1431:11: error: too many arguments to func=
tion 'drm_dp_has_quirk'
 1431 |   return (drm_dp_has_quirk(&ctrl->panel->desc, edid_quirks,
      |           ^~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/msm/dp/dp_ctrl.c:15:
include/drm/drm_dp_helper.h:2087:1: note: declared here
 2087 | drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk =
quirk)
      | ^~~~~~~~~~~~~~~~

Caused by commit

  7c553f8b5a7d ("drm/dp: Revert "drm/dp: Introduce EDID-based quirks"")

Since the drm-intel tree still has its other build failure, I used the
version from next-20210108 again today.

--=20
Cheers,
Stephen Rothwell

--Sig_/7BT8h2PLWsOJZo2F4=5Rm_T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHcdsACgkQAVBC80lX
0GyL0gf9Gykgwv1C+podlywSGDeNb325PRn53gcy3mTvRd319wLt8Kna1AT/js1V
lACULa7REx8bsskFFYlqIBuDBtr/ynoSM5Ptti+WRvBVwoPHzXfwlRNwIJnjepIb
UgCDcuFz6V+FWEQL2VhPL2ZmI+BkaNPTfZiiJGrwT2MKChkiq0dB/3EtxTxn6hP1
6e2oNmiX/byN+hPWfKBM7L1mI0C8mpglDT60vipysRsvUFT0TGMRgOdSNYYIfa23
RWbn4icWFGv8XQEhIfbMg4rhYwU0V7qkg7vxw6SrPDZdm/1lZz6l26ep8Aq6Dwr7
sEXT+ctNIffoWWjfSxpkXMbxmw3l5g==
=0Jnl
-----END PGP SIGNATURE-----

--Sig_/7BT8h2PLWsOJZo2F4=5Rm_T--

--===============1580378186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1580378186==--
