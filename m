Return-Path: <SRS0=Tqpp=JK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4F1C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 01:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71FC6600CD
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 01:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71FC6600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F9E6E0EC;
	Tue, 13 Apr 2021 01:23:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8086E0EC
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Apr 2021 01:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618277037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vdb72vFtidwPinNRFHvros4PP2idQiBFZaTUwAj2cuc=;
 b=KuJf+Pd7fIRXRyXi8juTMJ5XGMMKU8eP4RIeNLiJlLHmiBbwJXB6EnXIOFp8yJw/LJ5oMw
 R5jAVuNTbLLANB3TYL/EG/mEeCAd+BeiWCP3ZGz7+4cXqqa1ZjZEYQCp9h0CtG3+Kg0RGP
 Pef8C6riI87tL4fXdVVxMBn0K4qVUjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-Z9JJU6_uN_KDYxPT0Ueucw-1; Mon, 12 Apr 2021 21:23:50 -0400
X-MC-Unique: Z9JJU6_uN_KDYxPT0Ueucw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 745D18030A1;
 Tue, 13 Apr 2021 01:23:49 +0000 (UTC)
Received: from x1.home.shazbot.org (ovpn-117-254.rdu2.redhat.com
 [10.10.117.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2442F6F13B;
 Tue, 13 Apr 2021 01:23:47 +0000 (UTC)
Date: Mon, 12 Apr 2021 19:23:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com
Message-ID: <20210412192347.042fbc14@x1.home.shazbot.org>
In-Reply-To: <20210412103214.337d521a@omen>
References: <20210412103214.337d521a@omen>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: Re: [Intel-gfx] Regression: gvt: vgpu 1: MI_LOAD_REGISTER_MEM
 handler error
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
Cc: yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021 10:32:14 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> Running a Windows guest on a i915-GVTg_V4_2 from an HD 5500 IGD on
> v5.12-rc6 results in host logs:
> 
> gvt: vgpu 1: lrm access to register (20c0)
> gvt: vgpu 1: MI_LOAD_REGISTER_MEM handler error
> gvt: vgpu 1: cmd parser error
> 0x0 
> 0x29 
> 
> gvt: vgpu 1: scan wa ctx error
> gvt: vgpu 1: failed to submit desc 0
> gvt: vgpu 1: fail submit workload on ring rcs0
> gvt: vgpu 1: fail to emulate MMIO write 00002230 len 4
> 
> The guest goes into a boot loop triggering this error before reaching
> the desktop and rebooting.  Guest using Intel driver 20.19.15.5171
> dated 11/4/2020 (from driver file 15.40.5171).
> 
> This VM works well with the same guest and userspace software stack on
> Fedora's kernel 5.11.11-200.fc33.x86_64.  Thanks,

Bisected to:

commit f18d417a57438498e0de481d3a0bc900c2b0e057
Author: Yan Zhao <yan.y.zhao@intel.com>
Date:   Wed Dec 23 11:45:08 2020 +0800

    drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
    
    do not allow "srm" and "lrm" except for GEN8_L3SQCREG4 and 0x21f0.
    
    Cc: Colin Xu <colin.xu@intel.com>
    Cc: Kevin Tian <kevin.tian@intel.com>
    Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
    Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
    Link: http://patchwork.freedesktop.org/patch/msgid/20201223034508.17031-1-yan.y.zhao@intel.com
    Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
