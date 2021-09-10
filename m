Return-Path: <SRS0=qdHQ=OA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99A4C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Sep 2021 03:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE10610C9
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Sep 2021 03:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AE10610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41D6E95E;
	Fri, 10 Sep 2021 03:18:10 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62C66E95C
 for <intel-gfx@lists.freedesktop.org>; Fri, 10 Sep 2021 03:18:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-OVuZzSf1M0mS36tOtRNffQ-1; Thu, 09 Sep 2021 23:18:05 -0400
X-MC-Unique: OVuZzSf1M0mS36tOtRNffQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9968E824FA7;
 Fri, 10 Sep 2021 03:18:04 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 547821045E80;
 Fri, 10 Sep 2021 03:18:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Dave Airlie <airlied@redhat.com>
Date: Fri, 10 Sep 2021 13:17:23 +1000
Message-Id: <20210910031741.3292388-8-airlied@gmail.com>
In-Reply-To: <20210910031741.3292388-1-airlied@gmail.com>
References: <20210910031741.3292388-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Subject: [Intel-gfx] [PATCH 07/25] drm/i915/display: add
 intel_fdi_link_train wrapper.
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

This wraps the fdi link training vfunc to make it clearer.

Suggested by Jani.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c     | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_fdi.h     | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm=
/i915/display/intel_display.c
index 71518e71591b..aa174192c279 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2156,7 +2156,7 @@ static void ilk_pch_enable(const struct intel_atomic_=
state *state,
 =09assert_pch_transcoder_disabled(dev_priv, pipe);
=20
 =09/* For PCH output, training FDI link */
-=09dev_priv->display.fdi_link_train(crtc, crtc_state);
+=09intel_fdi_link_train(crtc, crtc_state);
=20
 =09/* We need to program the right clock selection before writing the pixe=
l
 =09 * mutliplier into the DPLL. */
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i91=
5/display/intel_fdi.c
index fc09b781f15f..339243399a65 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -10,6 +10,14 @@
 #include "intel_fdi.h"
 #include "intel_sideband.h"
=20
+void intel_fdi_link_train(struct intel_crtc *crtc,
+=09=09=09  const struct intel_crtc_state *crtc_state)
+{
+=09struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
+
+=09dev_priv->display.fdi_link_train(crtc, crtc_state);
+}
+
 /* units of 100MHz */
 static int pipe_required_fdi_lanes(struct intel_crtc_state *crtc_state)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.h b/drivers/gpu/drm/i91=
5/display/intel_fdi.h
index 60acf2133145..61cb216a09f5 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.h
+++ b/drivers/gpu/drm/i915/display/intel_fdi.h
@@ -26,4 +26,6 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 void intel_fdi_pll_freq_update(struct drm_i915_private *i915);
 void lpt_fdi_program_mphy(struct drm_i915_private *i915);
=20
+void intel_fdi_link_train(struct intel_crtc *crtc,
+=09=09=09  const struct intel_crtc_state *crtc_state);
 #endif
--=20
2.31.1

