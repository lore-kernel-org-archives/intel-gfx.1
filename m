Return-Path: <SRS0=8Ejf=N7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DE8C433EF
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Sep 2021 01:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2900060F23
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Sep 2021 01:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2900060F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BBB6E415;
	Thu,  9 Sep 2021 01:11:40 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9ED6E415
 for <intel-gfx@lists.freedesktop.org>; Thu,  9 Sep 2021 01:11:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-0pL_hEWQOzKtaUpvJvlEJQ-1; Wed, 08 Sep 2021 21:11:34 -0400
X-MC-Unique: 0pL_hEWQOzKtaUpvJvlEJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CEC11006AA0;
 Thu,  9 Sep 2021 01:11:33 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AEF326E41;
 Thu,  9 Sep 2021 01:11:31 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>
Date: Thu,  9 Sep 2021 11:10:51 +1000
Message-Id: <20210909011100.2987971-15-airlied@gmail.com>
In-Reply-To: <20210909011100.2987971-1-airlied@gmail.com>
References: <20210909011100.2987971-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Subject: [Intel-gfx] [PATCH 14/23] drm/i915: constify fdi link training
 vtable
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Put the vtable into ro memory.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_fdi.c | 20 ++++++++++++++++----
 drivers/gpu/drm/i915/i915_drv.h          |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i91=
5/display/intel_fdi.c
index 94bb7e039fe7..148fb50035ff 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -15,7 +15,7 @@ void intel_fdi_link_train(struct intel_crtc *crtc,
 {
 =09struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
=20
-=09dev_priv->fdi_funcs.fdi_link_train(crtc, crtc_state);
+=09dev_priv->fdi_funcs->fdi_link_train(crtc, crtc_state);
 }
=20
 /* units of 100MHz */
@@ -1013,15 +1013,27 @@ void lpt_fdi_program_mphy(struct drm_i915_private *=
dev_priv)
 =09intel_sbi_write(dev_priv, 0x21EC, tmp, SBI_MPHY);
 }
=20
+static const struct intel_fdi_funcs ilk_funcs =3D {
+=09.fdi_link_train =3D ilk_fdi_link_train,
+};
+
+static const struct intel_fdi_funcs gen6_funcs =3D {
+=09.fdi_link_train =3D gen6_fdi_link_train,
+};
+
+static const struct intel_fdi_funcs ivb_funcs =3D {
+=09.fdi_link_train =3D ivb_manual_fdi_link_train,
+};
+
 void
 intel_fdi_init_hook(struct drm_i915_private *dev_priv)
 {
 =09if (IS_IRONLAKE(dev_priv)) {
-=09=09dev_priv->fdi_funcs.fdi_link_train =3D ilk_fdi_link_train;
+=09=09dev_priv->fdi_funcs =3D &ilk_funcs;
 =09} else if (IS_SANDYBRIDGE(dev_priv)) {
-=09=09dev_priv->fdi_funcs.fdi_link_train =3D gen6_fdi_link_train;
+=09=09dev_priv->fdi_funcs =3D &gen6_funcs;
 =09} else if (IS_IVYBRIDGE(dev_priv)) {
 =09=09/* FIXME: detect B0+ stepping and use auto training */
-=09=09dev_priv->fdi_funcs.fdi_link_train =3D ivb_manual_fdi_link_train;
+=09=09dev_priv->fdi_funcs =3D &ivb_funcs;
 =09}
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_dr=
v.h
index 575c46df5336..bb44ef4f6356 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -991,7 +991,7 @@ struct drm_i915_private {
 =09struct intel_hotplug_funcs hotplug_funcs;
=20
 =09/* fdi display functions */
-=09struct intel_fdi_funcs fdi_funcs;
+=09const struct intel_fdi_funcs *fdi_funcs;
=20
 =09/* display pll funcs */
 =09struct intel_dpll_funcs dpll_funcs;
--=20
2.31.1

