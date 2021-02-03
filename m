Return-Path: <SRS0=vatO=HF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C515C433E0
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 21:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2869F64F68
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 21:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2869F64F68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEB06EBB7;
	Wed,  3 Feb 2021 21:15:16 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139936EBB7;
 Wed,  3 Feb 2021 21:15:16 +0000 (UTC)
IronPort-SDR: fUmksrj/yRx+ixYOyJorZXshRf9ujVuhJDeCEabvv9OnWS0cqIIQqdIMyI1/t1ABronjzwQ2Pa
 lmbEYMhHcg8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="265950962"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="265950962"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 13:15:15 -0800
IronPort-SDR: 73OLoKlVIQ9idFotB583rxlu4y8+B/3Dy0UVHEkyzOwwNF3IlSufmgdnHFyuac8DEA3R9Km0DK
 HkM9pC72Ruyg==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="371687075"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 13:15:13 -0800
Date: Wed, 3 Feb 2021 23:15:09 +0200
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Thiago Macieira <gitlab@gitlab.freedesktop.org>
Message-ID: <20210203211509.GA601130@ideak-desk.fi.intel.com>
References: <20210201120145.350258-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201120145.350258-1-imre.deak@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/dp_mst: Don't report ports
 connected if nothing is attached to them
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 02:01:42PM +0200, Imre Deak wrote:
> Reporting a port as connected if nothing is attached to them leads to
> any i2c transactions on this port trying to use an uninitialized i2c
> adapter, fix this.
> 
> Let's account for this case even if branch devices have no good reason
> to report a port as unplugged with their peer device type set to 'none'.
> 
> Fixes: db1a07956968 ("drm/dp_mst: Handle SST-only branch device case")
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/2987
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/1963
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: <stable@vger.kernel.org> # v5.5+
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Thanks for the report and review, I pushed this one patch to
drm-misc-fixes.

I fixed a typo in the commit message.

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index e82b596d646c..deb7995f42fa 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4224,6 +4224,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
>  
>  	switch (port->pdt) {
>  	case DP_PEER_DEVICE_NONE:
> +		break;
>  	case DP_PEER_DEVICE_MST_BRANCHING:
>  		if (!port->mcs)
>  			ret = connector_status_connected;
> -- 
> 2.25.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
